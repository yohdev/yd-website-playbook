#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// Skill activation detection
function detectActivation(input) {
    const triggers = [
        /sales handoff/i,
        /discovery brief/i,
        /client kickoff/i,
        /run the yohdev playbook/i,
        /start phase 01/i
    ];
    
    return triggers.some(trigger => trigger.test(input));
}

// Check for Sales Handoff folder
function findHandoffFolder() {
    const patterns = ['Sales Handoff', 'Sales Handoff —'];
    
    try {
        const files = fs.readdirSync(process.cwd());
        
        for (const file of files) {
            for (const pattern of patterns) {
                if (file.startsWith(pattern) && fs.statSync(file).isDirectory()) {
                    return file;
                }
            }
        }
    } catch (error) {
        console.error('Error scanning for handoff folder:', error);
    }
    
    return null;
}

// Main skill execution
class YohDevWebsiteRefresh {
    constructor() {
        this.stateFile = path.join(process.cwd(), '.yohdev-state.json');
        this.state = this.loadState();
    }
    
    loadState() {
        if (fs.existsSync(this.stateFile)) {
            return JSON.parse(fs.readFileSync(this.stateFile, 'utf8'));
        }
        
        return {
            version: "0.1.0",
            client: null,
            current_phase: null,
            completed_phases: [],
            phase_outputs: {},
            config: {
                handoff_dir: null,
                output_dir: "output",
                client_slug: null
            }
        };
    }
    
    saveState() {
        fs.writeFileSync(this.stateFile, JSON.stringify(this.state, null, 2));
    }
    
    run() {
        console.log('🚀 YohDev Website Refresh Skill Activated');
        console.log('=========================================\n');
        
        // Find handoff folder
        const handoffDir = this.state.config.handoff_dir || findHandoffFolder();
        
        if (!handoffDir) {
            console.log('❌ No Sales Handoff folder found.');
            console.log('\nPlease ensure you have a "Sales Handoff" folder with the 8 required MD files:');
            console.log('  01-Discovery-Brief.md');
            console.log('  02-Brand-Identity.md');
            console.log('  03-Logo-and-Colors.md');
            console.log('  04-Current-Website.md');
            console.log('  05-Target-Audience.md');
            console.log('  06-Personas.md');
            console.log('  07-Strategy.md');
            console.log('  08-Client-Profile.md');
            console.log('\nOr create a new client folder with: npm run new-client "Client Name"');
            return;
        }
        
        this.state.config.handoff_dir = handoffDir;
        this.saveState();
        
        console.log(`📁 Found handoff folder: ${handoffDir}\n`);
        
        // Check handoff readiness
        console.log('Checking handoff readiness...\n');
        
        try {
            const scriptPath = path.join(__dirname, 'scripts', 'check-handoff.sh');
            execSync(`bash "${scriptPath}" "${handoffDir}"`, { stdio: 'inherit' });
        } catch (error) {
            if (error.status === 2) {
                console.log('\n⚠️  Handoff has unfilled placeholders.');
                console.log('These will become questions in Phase 01.\n');
            } else if (error.status === 1) {
                console.log('\n❌ Handoff package is incomplete. Please fix and try again.');
                return;
            }
        }
        
        // Determine next phase
        const nextPhase = this.getNextPhase();
        
        if (!nextPhase) {
            console.log('✅ All phases complete! Package ready for delivery.');
            return;
        }
        
        console.log(`\n📍 Next phase: ${this.getPhaseTitle(nextPhase)}`);
        console.log('─'.repeat(50));
        
        // Show phase description
        this.showPhaseInfo(nextPhase);
        
        console.log('\nTo continue, run the appropriate phase command or use:');
        console.log('  npm run continue');
    }
    
    getNextPhase() {
        const phases = ['phase_01', 'phase_02', 'phase_03', 'phase_04', 'phase_05', 'phase_06'];
        
        for (const phase of phases) {
            if (!this.state.completed_phases.includes(phase)) {
                return phase;
            }
        }
        
        return null;
    }
    
    getPhaseTitle(phase) {
        const titles = {
            'phase_01': 'Phase 01 - Intake',
            'phase_02': 'Phase 02 - Research',
            'phase_03': 'Phase 03 - System',
            'phase_04': 'Phase 04 - Home Page',
            'phase_05': 'Phase 05 - Style Guide',
            'phase_06': 'Phase 06 - Package'
        };
        
        return titles[phase] || phase;
    }
    
    showPhaseInfo(phase) {
        const phaseFile = path.join(__dirname, 'phases', `${phase.replace('_', '-')}.md`);
        
        if (fs.existsSync(phaseFile)) {
            const content = fs.readFileSync(phaseFile, 'utf8');
            const purposeMatch = content.match(/## Purpose\n(.+?)(?=\n##)/s);
            
            if (purposeMatch) {
                console.log('\n' + purposeMatch[1].trim());
            }
        }
    }
}

// CLI entry point
if (require.main === module) {
    const skill = new YohDevWebsiteRefresh();
    
    // Check if skill should activate based on input
    const input = process.argv.slice(2).join(' ');
    
    if (input && !detectActivation(input)) {
        console.log('This doesn\'t appear to be a YohDev Website Refresh request.');
        console.log('Try: "run the YohDev playbook" or "start Phase 01"');
        process.exit(0);
    }
    
    skill.run();
}

module.exports = { YohDevWebsiteRefresh, detectActivation, findHandoffFolder };