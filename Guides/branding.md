# NueSynergy Forms Branding Guide

This document defines the visual design system, branding standards, and technical implementation patterns for NueSynergy Forms. It incorporates modern styling, animations, validation, and accessibility features to ensure a consistent, professional user experience across all forms.

**Last Updated:** Based on FSA Administration Adoption Agreement (Form Version 2.1)

## Table of Contents
1. [Brand Identity](#brand-identity)
2. [Technical Stack](#technical-stack)
3. [Color Palette](#color-palette)
4. [Typography](#typography)
5. [Layout & Spacing](#layout--spacing)
6. [Component Patterns](#component-patterns)
7. [Interactive Journey Tracker](#interactive-journey-tracker)
8. [Form Validation](#form-validation)
9. [Animations & Effects](#animations--effects)
10. [Accessibility Standards](#accessibility-standards)
11. [Multi-Step Form Patterns](#multi-step-form-patterns)
12. [Webhook Integration](#webhook-integration)
13. [Best Practices](#best-practices)

## Brand Identity

### Logo & Tagline
- **Brand Name**: NueSynergy
- **Tagline**: "CUSTOMER FOCUSED & TECHNOLOGY DRIVEN"
- **Contact**: 1-800-413-4138 | employersupport@nuesynergy.com

## Technical Stack

### Required Libraries & CDN Resources

All NueSynergy forms should include the following resources in the `<head>` section:

```html
<!-- Performance: Preload critical resources -->
<link rel="preload" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" as="style">
<link rel="preload" href="https://cdn.tailwindcss.com" as="script">
<link rel="preload" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" as="style">

<!-- CSS Frameworks & Fonts -->
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

<!-- Animation Libraries -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>

<!-- Signature Pad (if digital signature required) -->
<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
```

### Library Usage Guidelines

#### Anime.js (Animation Library)
**When to Use:**
- Page load animations
- Step transitions in multi-step forms
- Button hover effects
- Form field focus animations
- Success/completion animations
- Progress indicators

**Key Features:**
- Smooth transitions between form steps
- Staggered animations for lists (journey steps, form fields)
- Elastic easing for playful interactions
- Confetti effects for success states

#### Signature Pad
**When to Use:**
- Forms requiring legal authorization
- Digital signature collection
- Agreement acknowledgments

**Features:**
- Touch and mouse support
- Responsive canvas sizing
- Clear/redo functionality
- Export to base64 data URL

#### Tailwind CSS
**Usage:**
- Utility-first CSS framework
- Use for responsive grids, spacing, and layout
- Supplement with custom CSS for brand-specific components

## Color Palette

### Primary Colors
```css
/* Primary Brand Colors */
--primary-blue: #1E4E6B;          /* Deep blue for headers, primary buttons */
--primary-blue-light: #2a5f7a;    /* Lighter blue for gradients */

/* Accent Colors */
--accent-green: #A4C639;          /* Lime green for highlights, CTAs */
--accent-green-hover: #8fb332;    /* Darker green for hover states */
--accent-green-dark: #4a5d23;     /* Dark green for text on light backgrounds */
```

### Supporting Colors
```css
/* Text Colors */
--text-primary: #2d3748;          /* Main body text */
--text-secondary: #64748b;        /* Secondary text, labels */
--text-white: #ffffff;            /* White text on dark backgrounds */

/* Background Colors */
--bg-primary: #f0f4f8;           /* Main page background start */
--bg-secondary: #e8f2f6;         /* Main page background end */
--bg-card: #ffffff;              /* Card/section backgrounds */
--bg-section: #f8fafc;           /* Section background start */
--bg-section-end: #f1f5f9;       /* Section background end */

/* Border & Accent Colors */
--border-default: #e2e8f0;       /* Default borders */
--border-focus: var(--accent-green);  /* Focus state borders */
--error: #e53e3e;                /* Error states */
--error-hover: #c53030;          /* Error hover states */
```

## Typography

### Font Stack
```css
font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
```

### Font Hierarchy
```css
/* Headings */
.logo { font-size: 2.5rem; font-weight: 700; }
.form-title { font-size: 1.8rem; font-weight: 600; }
.section-title { font-size: 1.3rem; font-weight: 600; }

/* Body Text */
.tagline { font-size: 1rem; opacity: 0.9; }
.form-label { font-size: 0.95rem; font-weight: 500; }
.form-input { font-size: 1rem; }
.checkbox-label { font-size: 0.9rem; line-height: 1.4; }
.step-label { font-size: 0.85rem; font-weight: 500; }
```

### Text Colors
- **Primary Text**: `#2d3748` on light backgrounds
- **Secondary Text**: `#64748b` for labels and secondary information
- **White Text**: `#ffffff` on dark backgrounds with optional opacity
- **Required Field Indicators**: `#e53e3e` (error color)

## Layout & Spacing

### Container System
```css
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}
```

### Responsive Breakpoints
- **Mobile**: 768px and below
- **Tablet**: 769px to 1023px
- **Desktop**: 1024px and above

### Grid Systems
```css
/* Form Grid */
.form-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
}

/* Signature Grid */
.signature-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
}
```

## Component Patterns

### Header Design
```css
.header {
    background: linear-gradient(135deg, #1E4E6B 0%, #2a5f7a 100%);
    color: white;
    padding: 30px;
    border-radius: 16px 16px 0 0;
    position: relative;
    overflow: hidden;
}

/* Animated background accent */
.header::before {
    background: radial-gradient(circle, rgba(164, 198, 57, 0.1) 0%, transparent 70%);
    animation: pulse 4s ease-in-out infinite;
}
```

### Card/Section Design
```css
.section {
    padding: 30px;
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
    border-radius: 12px;
    border-left: 4px solid #A4C639;
    transition: all 0.3s ease;
}

.section:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.1);
}
```

### Form Elements
```css
.form-group input,
.form-group select,
.form-group textarea {
    padding: 12px 16px;
    border: 2px solid #e2e8f0;
    border-radius: 8px;
    font-size: 1rem;
    transition: all 0.3s ease;
    background: white;
}

.form-group input:focus {
    outline: none;
    border-color: #A4C639;
    box-shadow: 0 0 0 3px rgba(164, 198, 57, 0.1);
    transform: translateY(-1px);
}
```

### Button System

#### Primary Buttons (Navigation)
```css
.nav-btn {
    background: linear-gradient(135deg, #1E4E6B 0%, #2a5f7a 100%);
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 8px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 12px rgba(30, 78, 107, 0.3);
}

.nav-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 16px rgba(30, 78, 107, 0.4);
}
```

#### Accent Buttons (Next/Submit)
```css
.nav-btn.next {
    background: linear-gradient(135deg, #A4C639 0%, #8fb332 100%);
    box-shadow: 0 4px 12px rgba(164, 198, 57, 0.3);
}

.nav-btn.next:hover {
    box-shadow: 0 6px 16px rgba(164, 198, 57, 0.4);
}
```

#### Submit Button (Final Form)
```css
.submit-btn {
    background: linear-gradient(135deg, #A4C639 0%, #8fb332 100%);
    color: white;
    padding: 16px 40px;
    border: none;
    border-radius: 50px;
    font-size: 1.1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 15px rgba(164, 198, 57, 0.3);
}
```

#### Destructive Buttons (Clear, Cancel)
```css
.signature-clear-btn {
    background: linear-gradient(135deg, #e53e3e 0%, #c53030 100%);
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 6px;
    font-size: 0.9rem;
    cursor: pointer;
    transition: all 0.3s ease;
}
```

## Interactive States

### Focus States
- **Border Color**: `#A4C639` (accent green)
- **Box Shadow**: `0 0 0 3px rgba(164, 198, 57, 0.1)`
- **Transform**: `translateY(-1px)` (subtle lift effect)

### Hover States
- **Cards**: `transform: translateY(-2px)` with enhanced shadow
- **Buttons**: `transform: translateY(-2px)` with enhanced shadow
- **Form Fields**: Subtle lift effect on focus

### Error States
```css
.field-error {
    border-color: #e53e3e;
    box-shadow: 0 0 0 3px rgba(229, 62, 62, 0.1);
}
```

### Success States
```css
.field-success {
    border-color: #A4C639;
    box-shadow: 0 0 0 3px rgba(164, 198, 57, 0.1);
}
```

## Progress Tracking Components

### Step Indicators
```css
.step-circle {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    border: 2px solid #e2e8f0;
    background: white;
    color: #64748b;
    transition: all 0.3s ease;
}

.step-circle.active {
    background: linear-gradient(135deg, #A4C639 0%, #8fb332 100%);
    color: white;
    border-color: #A4C639;
    box-shadow: 0 4px 12px rgba(164, 198, 57, 0.3);
}

.step-circle.completed {
    background: linear-gradient(135deg, #1E4E6B 0%, #2a5f7a 100%);
    color: white;
    border-color: #1E4E6B;
}
```

### Progress Bar
```css
.progress-line-fill {
    height: 100%;
    background: linear-gradient(90deg, #A4C639 0%, #8fb332 100%);
    transition: width 0.5s ease;
    border-radius: 1px;
}
```

## Special Components

### Signature Section
```css
.signature-section {
    padding: 30px;
    background: linear-gradient(135deg, #1E4E6B 0%, #2a5f7a 100%);
    border-radius: 12px;
    color: white;
}

.signature-canvas-container {
    background: white;
    border: 2px solid rgba(164, 198, 57, 0.8);
    border-radius: 8px;
    padding: 10px;
}
```

### Section Icons
```css
.section-icon {
    width: 24px;
    height: 24px;
    background: linear-gradient(135deg, #A4C639 0%, #8fb332 100%);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: bold;
    font-size: 0.9rem;
}
```

## Interactive Journey Tracker

The Journey Tracker is a modern, interactive progress indicator for multi-step forms that replaces traditional progress bars with an engaging visual experience.

### HTML Structure

```html
<nav role="navigation" aria-label="Form progress" class="mb-8">
    <div class="process-visualization animate-in" id="journey-tracker">
        <div class="flex justify-between items-center mb-6">
            <div>
                <h3 class="text-2xl font-bold nue-primary-text flex items-center">
                    <i class="fas fa-route mr-3 text-3xl"></i>Your Journey
                </h3>
                <p class="text-sm text-gray-600 mt-1 ml-12">Track your progress through the form</p>
            </div>
            <div class="text-right">
                <span class="text-3xl font-bold nue-secondary-text" id="progressText">Step 1</span>
                <p class="text-sm text-gray-600">of X steps</p>
            </div>
        </div>
        
        <!-- Animated Progress Bar -->
        <div class="relative w-full bg-gray-200 rounded-full h-3 mb-8 overflow-hidden">
            <div class="progress-bar h-3 rounded-full transition-all duration-700 ease-out relative" 
                 id="progressBar" style="width: 16.67%">
                <div class="absolute inset-0 bg-gradient-to-r from-transparent via-white to-transparent opacity-30 animate-shimmer"></div>
            </div>
        </div>
        
        <!-- Interactive Step Cards -->
        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-4">
            <!-- Repeat for each step -->
            <div class="journey-step active" id="journey-step-1" data-step="1">
                <div class="journey-step-inner">
                    <div class="journey-icon-wrapper">
                        <i class="fas fa-building journey-icon"></i>
                        <div class="journey-checkmark hidden">
                            <i class="fas fa-check"></i>
                        </div>
                    </div>
                    <div class="journey-number">1</div>
                    <h4 class="journey-title">Step Name</h4>
                    <p class="journey-description">Brief description</p>
                </div>
            </div>
        </div>
    </div>
</nav>
```

### CSS Styling

```css
/* Journey Tracker Container */
.process-visualization {
    background: white;
    border-radius: 16px;
    padding: 2rem;
    margin-bottom: 2rem;
    box-shadow: 0 8px 32px rgba(30, 78, 107, 0.1);
}

/* Journey Step Cards */
.journey-step {
    position: relative;
    background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
    border: 2px solid #e5e7eb;
    border-radius: 12px;
    padding: 1.5rem 1rem;
    transition: all 0.3s ease;
    cursor: default;
    overflow: hidden;
}

.journey-step::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 4px;
    background: linear-gradient(90deg, transparent, var(--secondary-green), transparent);
    transform: translateX(-100%);
    transition: transform 0.6s ease;
}

.journey-step:hover::before {
    transform: translateX(100%);
}

/* Icon Wrapper */
.journey-icon-wrapper {
    position: relative;
    width: 60px;
    height: 60px;
    margin: 0 auto 1rem;
    background: linear-gradient(135deg, #f0f4f0 0%, #e5e7eb 100%);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
}

.journey-icon {
    font-size: 1.5rem;
    color: #6b7280;
    transition: all 0.3s ease;
}

/* Step Number Badge */
.journey-number {
    position: absolute;
    top: -8px;
    right: -8px;
    width: 28px;
    height: 28px;
    background: linear-gradient(135deg, #6b7280 0%, #9ca3af 100%);
    color: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.75rem;
    font-weight: 700;
    border: 3px solid white;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
}

/* Checkmark for Completed Steps */
.journey-checkmark {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) scale(0);
    width: 70px;
    height: 70px;
    background: var(--secondary-green);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.4s cubic-bezier(0.68, -0.55, 0.265, 1.55);
    z-index: 2;
}

.journey-checkmark i {
    color: white;
    font-size: 1.75rem;
    font-weight: bold;
}

/* Step Text */
.journey-title {
    font-size: 0.95rem;
    font-weight: 600;
    color: #6b7280;
    margin-bottom: 0.5rem;
    transition: all 0.3s ease;
}

.journey-description {
    font-size: 0.75rem;
    color: #9ca3af;
    line-height: 1.3;
    transition: all 0.3s ease;
}

/* ACTIVE STATE - Current Step */
.journey-step.active {
    background: linear-gradient(135deg, #A4C639 0%, #8fb030 100%);
    border-color: #A4C639;
    box-shadow: 0 8px 24px rgba(164, 198, 57, 0.3);
    transform: translateY(-4px);
}

.journey-step.active .journey-icon-wrapper {
    background: rgba(255, 255, 255, 0.3);
    animation: pulse 2s ease-in-out infinite;
}

.journey-step.active .journey-icon {
    color: white;
    transform: scale(1.1);
}

.journey-step.active .journey-number {
    background: linear-gradient(135deg, #1E4E6B 0%, #2a5f7f 100%);
    box-shadow: 0 4px 12px rgba(30, 78, 107, 0.4);
}

.journey-step.active .journey-title,
.journey-step.active .journey-description {
    color: white;
}

/* COMPLETED STATE - Past Steps */
.journey-step.completed {
    background: linear-gradient(135deg, #1E4E6B 0%, #2a5f7f 100%);
    border-color: #1E4E6B;
    box-shadow: 0 4px 16px rgba(30, 78, 107, 0.2);
}

.journey-step.completed .journey-icon-wrapper {
    background: rgba(255, 255, 255, 0.2);
}

.journey-step.completed .journey-icon {
    color: rgba(255, 255, 255, 0.5);
}

.journey-step.completed .journey-checkmark {
    transform: translate(-50%, -50%) scale(1);
}

.journey-step.completed .journey-checkmark.hidden {
    display: flex !important;
}

.journey-step.completed .journey-number {
    background: linear-gradient(135deg, #A4C639 0%, #8fb030 100%);
}

.journey-step.completed .journey-title,
.journey-step.completed .journey-description {
    color: white;
}

/* PENDING STATE - Future Steps */
.journey-step.pending {
    opacity: 0.7;
}

.journey-step.pending:hover {
    opacity: 0.85;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

/* Progress Bar Shimmer Effect */
@keyframes shimmer {
    0% { transform: translateX(-100%); }
    100% { transform: translateX(200%); }
}

.animate-shimmer {
    animation: shimmer 2s infinite;
}

/* Pulse Animation */
@keyframes pulse {
    0%, 100% { transform: scale(1); opacity: 1; }
    50% { transform: scale(1.05); opacity: 0.8; }
}

/* Responsive Design */
@media (max-width: 768px) {
    .journey-step {
        padding: 1rem 0.75rem;
    }
    
    .journey-icon-wrapper {
        width: 50px;
        height: 50px;
    }
    
    .journey-icon {
        font-size: 1.25rem;
    }
    
    .journey-number {
        width: 24px;
        height: 24px;
        font-size: 0.7rem;
    }
    
    .journey-title {
        font-size: 0.85rem;
    }
    
    .journey-description {
        font-size: 0.7rem;
    }
}
```

### JavaScript Integration

```javascript
// Update progress and journey steps
function updateProgress() {
    const progress = (currentStep / TOTAL_STEPS) * 100;
    
    // Update progress bar
    if (elements.progressBar) {
        elements.progressBar.style.width = `${progress}%`;
    }
    
    // Update step text
    if (elements.progressText) {
        elements.progressText.textContent = `Step ${currentStep}`;
    }
    
    // Update journey step cards
    for (let i = 1; i <= TOTAL_STEPS; i++) {
        const journeyStep = document.getElementById(`journey-step-${i}`);
        if (journeyStep) {
            journeyStep.className = 'journey-step';
            
            if (i < currentStep) {
                journeyStep.classList.add('completed');
            } else if (i === currentStep) {
                journeyStep.classList.add('active');
            } else {
                journeyStep.classList.add('pending');
            }
        }
    }
    
    // Announce to screen readers
    announceToScreenReader(`Step ${currentStep} of ${TOTAL_STEPS}`);
}

// Animate journey steps on load
function initJourneyAnimations() {
    if (typeof anime !== 'undefined') {
        // Animate journey tracker container
        anime({
            targets: '#journey-tracker',
            opacity: [0, 1],
            translateY: [30, 0],
            duration: 1000,
            delay: 300,
            easing: 'easeOutExpo'
        });
        
        // Animate journey step cards with stagger
        anime({
            targets: '.journey-step',
            opacity: [0, 1],
            translateY: [30, 0],
            scale: [0.9, 1],
            delay: anime.stagger(80, {start: 600}),
            duration: 800,
            easing: 'easeOutElastic(1, .6)'
        });
    }
}
```

## Form Validation

### Client-Side Validation Pattern

All forms must implement robust client-side validation before submission:

```javascript
function validateCurrentStep() {
    const currentStepElement = document.getElementById(`step${currentStep}`);
    if (!currentStepElement) return false;
    
    const requiredFields = currentStepElement.querySelectorAll('[required]');
    let isValid = true;
    const errors = [];
    
    // Clear previous errors
    currentStepElement.querySelectorAll('.error').forEach(field => {
        field.classList.remove('error');
    });
    
    // Validate each required field
    for (const field of requiredFields) {
        // IMPORTANT: Skip validation if field or parent is hidden
        const parentDiv = field.closest('div[id$="Field"]') || field.closest('div[id*="Details"]');
        if (parentDiv && parentDiv.style.display === 'none') {
            continue; // Skip hidden conditional fields
        }
        
        // Also check if field itself is hidden
        if (field.style.display === 'none' || field.offsetParent === null) {
            continue;
        }
        
        // Validate based on field type
        if (field.type === 'radio') {
            const radioGroup = currentStepElement.querySelectorAll(`input[name="${field.name}"]`);
            const isChecked = Array.from(radioGroup).some(radio => radio.checked);
            if (!isChecked) {
                isValid = false;
                errors.push(`Please select a ${field.name} option`);
            }
        } else if (field.type === 'checkbox' && field.hasAttribute('required')) {
            if (!field.checked) {
                field.classList.add('error');
                isValid = false;
            }
        } else if (!field.value.trim()) {
            field.classList.add('error');
            isValid = false;
        }
    }
    
    // Announce validation results to screen readers
    if (!isValid) {
        announceError(`Form validation failed: ${errors.join(', ')}`);
    }
    
    return isValid;
}
```

### Conditional Field Management

For fields that appear/hide based on user selections:

```javascript
// Example: Toggle conditional field
function toggleConditionalField() {
    const triggerField = document.querySelector('input[name="trigger"]:checked');
    const conditionalField = document.getElementById('conditionalField');
    const conditionalInput = conditionalField.querySelector('input');
    
    if (triggerField && triggerField.value === 'yes') {
        conditionalField.style.display = 'block';
        conditionalInput.required = true; // Make required when visible
    } else {
        conditionalField.style.display = 'none';
        conditionalInput.required = false; // Remove requirement when hidden
        conditionalInput.value = ''; // Clear value
    }
}
```

### Error Display

```css
/* Error state for form inputs */
.form-input.error {
    border-color: #EF4444;
    box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1);
}

.error-message {
    color: #EF4444;
    font-size: 14px;
    margin-top: 4px;
}
```

## Animations & Effects

### Page Load Animations

```javascript
function initAnimeAnimations() {
    if (typeof anime === 'undefined') return;
    
    // Animate header on load
    anime({
        targets: 'header.animate-in',
        opacity: [0, 1],
        translateY: [-30, 0],
        duration: 1200,
        easing: 'easeOutExpo'
    });
    
    // Animate journey tracker
    anime({
        targets: '#journey-tracker',
        opacity: [0, 1],
        translateY: [30, 0],
        duration: 1000,
        delay: 300,
        easing: 'easeOutExpo'
    });
    
    // Animate journey step cards with stagger
    anime({
        targets: '.journey-step',
        opacity: [0, 1],
        translateY: [30, 0],
        scale: [0.9, 1],
        delay: anime.stagger(80, {start: 600}),
        duration: 800,
        easing: 'easeOutElastic(1, .6)'
    });
}
```

### Button Hover Animations

```javascript
// Button hover animations
const buttons = document.querySelectorAll('.btn-primary, .btn-secondary');
buttons.forEach(button => {
    button.addEventListener('mouseenter', function() {
        anime({
            targets: this,
            scale: 1.05,
            duration: 300,
            easing: 'easeOutQuad'
        });
    });
    
    button.addEventListener('mouseleave', function() {
        anime({
            targets: this,
            scale: 1,
            duration: 300,
            easing: 'easeOutQuad'
        });
    });
});
```

### Form Field Focus Animations

```javascript
// Form field focus animations
const formInputs = document.querySelectorAll('.form-input');
formInputs.forEach(input => {
    input.addEventListener('focus', function() {
        anime({
            targets: this,
            scale: [1, 1.02, 1],
            duration: 600,
            easing: 'easeInOutQuad'
        });
    });
});
```

### Step Transition Animations

```javascript
function updateDisplay() {
    // ... (hide all steps, show current step)
    
    // Animate current step entrance
    if (typeof anime !== 'undefined') {
        const currentStepElement = document.getElementById(`step${currentStep}`);
        if (currentStepElement) {
            anime({
                targets: currentStepElement,
                opacity: [0, 1],
                translateX: [50, 0],
                duration: 800,
                easing: 'easeOutExpo'
            });
            
            // Animate form groups within the step
            anime({
                targets: `#step${currentStep} .field-group`,
                opacity: [0, 1],
                translateY: [20, 0],
                delay: anime.stagger(50, {start: 200}),
                duration: 600,
                easing: 'easeOutQuad'
            });
        }
        
        // Animate progress bar
        anime({
            targets: '#progressBar',
            width: `${(currentStep / TOTAL_STEPS) * 100}%`,
            duration: 1000,
            easing: 'easeInOutQuad'
        });
        
        // Pulse active journey step
        anime({
            targets: `#journey-step-${currentStep}`,
            scale: [1, 1.05, 1],
            duration: 600,
            easing: 'easeInOutQuad'
        });
        
        // Animate checkmarks for completed steps
        for (let i = 1; i < currentStep; i++) {
            const checkmark = document.querySelector(`#journey-step-${i} .journey-checkmark`);
            if (checkmark) {
                anime({
                    targets: checkmark,
                    scale: [0, 1.2, 1],
                    rotate: [0, 360],
                    duration: 600,
                    delay: i * 100,
                    easing: 'easeOutElastic(1, .6)'
                });
            }
        }
    }
}
```

### Success Animation with Confetti

```javascript
function showSuccessAnimation() {
    if (typeof anime === 'undefined') return;
    
    // Create success overlay
    const overlay = document.createElement('div');
    overlay.className = 'fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50';
    overlay.innerHTML = `
        <div class="bg-white rounded-2xl p-8 max-w-md mx-4 text-center">
            <div class="success-checkmark mb-6">
                <div class="check-icon">
                    <span class="icon-line line-tip"></span>
                    <span class="icon-line line-long"></span>
                </div>
            </div>
            <h3 class="text-2xl font-bold nue-primary-text mb-2">Success!</h3>
            <p class="text-gray-600 mb-4">Your form has been submitted successfully.</p>
            <button onclick="this.closest('.fixed').remove()" class="btn-primary">Close</button>
        </div>
    `;
    
    document.body.appendChild(overlay);
    
    // Animate overlay and card
    anime({
        targets: overlay,
        opacity: [0, 1],
        duration: 300,
        easing: 'easeOutQuad'
    });
    
    anime({
        targets: overlay.querySelector('.bg-white'),
        opacity: [0, 1],
        scale: [0.8, 1],
        duration: 600,
        delay: 200,
        easing: 'easeOutElastic(1, .8)'
    });
    
    // Confetti animation
    for (let i = 0; i < 20; i++) {
        const particle = document.createElement('div');
        particle.style.cssText = `
            position: fixed;
            width: 10px;
            height: 10px;
            background: ${i % 2 === 0 ? '#1E4E6B' : '#A4C639'};
            border-radius: 50%;
            pointer-events: none;
            z-index: 9999;
        `;
        document.body.appendChild(particle);
        
        anime({
            targets: particle,
            translateX: anime.random(-300, 300),
            translateY: [0, anime.random(300, 600)],
            opacity: [1, 0],
            scale: [1, 0],
            rotate: anime.random(0, 360),
            duration: anime.random(1000, 2000),
            easing: 'easeOutQuad',
            complete: () => particle.remove()
        });
    }
}
```

### Success Checkmark CSS

```css
.success-checkmark {
    width: 80px;
    height: 80px;
    margin: 0 auto;
}

.success-checkmark .check-icon {
    width: 80px;
    height: 80px;
    position: relative;
    border-radius: 50%;
    box-sizing: content-box;
    border: 4px solid #A4C639;
}

.success-checkmark .icon-line {
    height: 5px;
    background-color: #A4C639;
    display: block;
    border-radius: 2px;
    position: absolute;
    z-index: 10;
}

.success-checkmark .icon-line.line-tip {
    top: 46px;
    left: 14px;
    width: 25px;
    transform: rotate(45deg);
    animation: icon-line-tip 0.75s;
}

.success-checkmark .icon-line.line-long {
    top: 38px;
    right: 8px;
    width: 47px;
    transform: rotate(-45deg);
    animation: icon-line-long 0.75s;
}

@keyframes icon-line-tip {
    0% { width: 0; left: 1px; top: 19px; }
    54% { width: 0; left: 1px; top: 19px; }
    70% { width: 50px; left: -8px; top: 37px; }
    84% { width: 17px; left: 21px; top: 48px; }
    100% { width: 25px; left: 14px; top: 45px; }
}

@keyframes icon-line-long {
    0% { width: 0; right: 46px; top: 54px; }
    65% { width: 0; right: 46px; top: 54px; }
    84% { width: 55px; right: 0px; top: 35px; }
    100% { width: 47px; right: 8px; top: 38px; }
}
```

## Animations

### Pulse Animation
```css
@keyframes pulse {
    0%, 100% { transform: scale(1); opacity: 0.3; }
    50% { transform: scale(1.1); opacity: 0.6; }
}
```

## Accessibility Standards

### Color Contrast
- Ensure minimum 4.5:1 contrast ratio for normal text
- Ensure minimum 3:1 contrast ratio for large text and UI elements
- Never rely on color alone to convey information

### Focus Management
- All interactive elements must have visible focus states
- Focus states use accent green with appropriate opacity
- Tab order follows visual layout

### Form Validation
- Error messages linked via `aria-describedby`
- Use `aria-live="polite"` for dynamic error regions
- Required fields marked with `aria-required="true"`

## Responsive Design

### Mobile Adaptations (768px and below)
```css
@media (max-width: 768px) {
    .container { padding: 10px; }
    .header { padding: 20px; }
    .form-content { padding: 20px; }
    .section { padding: 20px; }
    .form-grid { grid-template-columns: 1fr; }
    
    .step-navigation {
        flex-direction: column;
        gap: 15px;
    }
    
    .nav-btn {
        width: 100%;
        max-width: 200px;
    }
}
```

## Multi-Step Form Patterns

### Form State Management

```javascript
'use strict';

// Constants
const TOTAL_STEPS = 6; // Adjust based on your form
let currentStep = 1;
let formData = {};

// Cache DOM elements for performance
const elements = {
    form: null,
    progressBar: null,
    progressText: null,
    statusMessage: null,
    errorMessage: null,
    nextBtn: null,
    prevBtn: null,
    submitBtn: null,
    saveProgressBtn: null
};

// Initialize on DOMContentLoaded
document.addEventListener('DOMContentLoaded', function() {
    try {
        cacheElements();
        loadSavedProgress();
        updateDisplay();
        setupEventListeners();
        announceToScreenReader('Form loaded and ready');
    } catch (error) {
        console.error('Error initializing form:', error);
        announceError('Form initialization failed');
    }
});

function cacheElements() {
    elements.form = document.getElementById('fsaForm');
    elements.progressBar = document.getElementById('progressBar');
    elements.progressText = document.getElementById('progressText');
    elements.statusMessage = document.getElementById('status-message');
    elements.errorMessage = document.getElementById('error-message');
    elements.nextBtn = document.getElementById('nextBtn');
    elements.prevBtn = document.getElementById('prevBtn');
    elements.submitBtn = document.getElementById('submitBtn');
    elements.saveProgressBtn = document.getElementById('saveProgressBtn');
}
```

### Navigation Functions

```javascript
function nextStep() {
    if (validateCurrentStep()) {
        saveCurrentStepData();
        if (currentStep < TOTAL_STEPS) {
            currentStep++;
            updateDisplay();
            announceToScreenReader(`Moved to step ${currentStep}`);
        }
    } else {
        announceError('Please fill in all required fields before continuing.');
        const firstErrorField = document.querySelector(`#step${currentStep} .error`);
        if (firstErrorField) {
            firstErrorField.focus();
        }
    }
}

function prevStep() {
    if (currentStep > 1) {
        saveCurrentStepData();
        currentStep--;
        updateDisplay();
        announceToScreenReader(`Moved back to step ${currentStep}`);
    }
}

function updateDisplay() {
    // Hide all steps
    for (let i = 1; i <= TOTAL_STEPS; i++) {
        const stepElement = document.getElementById(`step${i}`);
        if (stepElement) {
            stepElement.classList.add('hidden');
        }
    }
    
    // Show current step
    const currentStepElement = document.getElementById(`step${currentStep}`);
    if (currentStepElement) {
        currentStepElement.classList.remove('hidden');
        currentStepElement.classList.add('fade-in');
    }
    
    // Smooth scroll to top
    window.scrollTo({ top: 0, behavior: 'smooth' });
    
    // Update navigation buttons
    if (elements.prevBtn) {
        elements.prevBtn.classList.toggle('hidden', currentStep === 1);
    }
    if (elements.nextBtn) {
        elements.nextBtn.classList.toggle('hidden', currentStep === TOTAL_STEPS);
    }
    if (elements.submitBtn) {
        elements.submitBtn.classList.toggle('hidden', currentStep !== TOTAL_STEPS);
    }
    
    updateProgress();
}
```

### LocalStorage Auto-Save

```javascript
function saveProgress() {
    try {
        saveCurrentStepData();
        
        const progressData = {
            currentStep: currentStep,
            formData: formData,
            timestamp: new Date().toISOString()
        };
        
        localStorage.setItem('formProgress', JSON.stringify(progressData));
        
        // Show success feedback
        if (elements.saveProgressBtn) {
            const originalText = elements.saveProgressBtn.textContent;
            elements.saveProgressBtn.textContent = '✓ Saved!';
            elements.saveProgressBtn.style.backgroundColor = '#A4C639';
            
            setTimeout(() => {
                elements.saveProgressBtn.textContent = originalText;
                elements.saveProgressBtn.style.backgroundColor = '';
            }, 2000);
        }
        
        announceToScreenReader('Progress saved successfully');
    } catch (error) {
        console.error('Error saving progress:', error);
        announceError('Failed to save progress');
    }
}

function loadSavedProgress() {
    try {
        const saved = localStorage.getItem('formProgress');
        if (saved) {
            const progress = JSON.parse(saved);
            
            if (progress.currentStep && progress.formData) {
                currentStep = Math.min(Math.max(progress.currentStep, 1), TOTAL_STEPS);
                formData = progress.formData;
                
                // Restore form values
                Object.keys(formData).forEach(name => {
                    const elements = document.querySelectorAll(`[name="${name}"]`);
                    elements.forEach(element => {
                        if (element.type === 'radio' || element.type === 'checkbox') {
                            element.checked = Array.isArray(formData[name]) && 
                                formData[name].includes(element.value);
                        } else {
                            element.value = formData[name] || '';
                        }
                    });
                });
                
                announceToScreenReader('Previous progress restored');
            }
        }
    } catch (error) {
        console.error('Error loading saved progress:', error);
        localStorage.removeItem('formProgress');
    }
}
```

## Webhook Integration

### Form Submission with Fallback

```javascript
// Webhook submission with error handling and fallback
async function submitToWebhook(data) {
    const webhookUrl = 'YOUR_WEBHOOK_URL_HERE';
    
    try {
        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), 30000); // 30 second timeout
        
        const response = await fetch(webhookUrl, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data),
            signal: controller.signal
        });
        
        clearTimeout(timeoutId);
        
        if (!response.ok) {
            throw new Error(`HTTP ${response.status}: ${response.statusText}`);
        }
        
        return { success: true, response };
        
    } catch (error) {
        console.warn('Primary webhook failed:', error);
        
        // Fallback to iframe submission
        try {
            return await submitFallback(data);
        } catch (fallbackError) {
            console.error('Both webhook and fallback failed:', fallbackError);
            throw new Error('All submission methods failed');
        }
    }
}

// Iframe fallback submission
function submitFallback(data) {
    return new Promise((resolve, reject) => {
        try {
            const iframe = document.createElement('iframe');
            iframe.style.display = 'none';
            iframe.name = 'webhook-fallback';
            document.body.appendChild(iframe);
            
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = 'YOUR_WEBHOOK_URL_HERE';
            form.target = 'webhook-fallback';
            
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'data';
            input.value = JSON.stringify(data);
            form.appendChild(input);
            
            document.body.appendChild(form);
            form.submit();
            
            // Cleanup after delay
            setTimeout(() => {
                try {
                    document.body.removeChild(iframe);
                    document.body.removeChild(form);
                } catch (cleanupError) {
                    console.warn('Cleanup error:', cleanupError);
                }
                resolve({ success: true, method: 'fallback' });
            }, 5000);
            
        } catch (error) {
            reject(error);
        }
    });
}
```

### Comprehensive Data Collection

```javascript
function collectAllFormData() {
    const allFormData = {
        form_type: 'Your_Form_Type',
        submittedAt: new Date().toISOString(),
        formVersion: '1.0',
        currentStep: currentStep,
        userAgent: navigator.userAgent
    };
    
    // Get all form elements
    const form = document.getElementById('yourForm');
    if (form) {
        const formData = new FormData(form);
        
        // Convert FormData to object
        for (let [key, value] of formData.entries()) {
            allFormData[key] = value;
        }
    }
    
    // Collect all inputs explicitly (including hidden/disabled)
    const allInputs = document.querySelectorAll('input, select, textarea');
    allInputs.forEach(input => {
        const name = input.name || input.id;
        if (name) {
            if (input.type === 'checkbox' || input.type === 'radio') {
                allFormData[`${name}_checked`] = input.checked;
                if (input.checked) {
                    allFormData[name] = input.value;
                }
            } else if (input.type === 'file') {
                allFormData[`${name}_hasFile`] = input.files && input.files.length > 0;
                if (input.files && input.files.length > 0) {
                    allFormData[`${name}_fileName`] = input.files[0].name;
                    allFormData[`${name}_fileSize`] = input.files[0].size;
                }
            } else {
                allFormData[name] = input.value || '';
            }
        }
    });
    
    return allFormData;
}

async function submitForm(e) {
    e.preventDefault();
    
    try {
        if (!validateCurrentStep()) {
            announceError('Please complete all required fields before submitting.');
            return;
        }
        
        // Show loading state
        const submitButton = document.querySelector('button[type="submit"]');
        if (submitButton) {
            submitButton.disabled = true;
            submitButton.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Submitting...';
        }
        
        announceToScreenReader('Submitting form, please wait...');
        
        const allFormData = collectAllFormData();
        const result = await submitToWebhook(allFormData);
        
        if (result.success) {
            showSuccessAnimation();
            
            // Clean up localStorage
            localStorage.removeItem('formProgress');
            
            // Reset form after delay
            setTimeout(() => {
                if (elements.form) {
                    elements.form.reset();
                }
                currentStep = 1;
                formData = {};
                updateDisplay();
            }, 3000);
        }
        
    } catch (error) {
        console.error('Form submission error:', error);
        announceError('Form submission failed. Please try again.');
        
        // Show error message
        const errorDiv = document.createElement('div');
        errorDiv.className = 'fixed top-4 right-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded z-50';
        errorDiv.innerHTML = `
            <strong>Error!</strong> Form submission failed. Please try again.
            <button onclick="this.parentElement.remove()" class="ml-4">&times;</button>
        `;
        document.body.appendChild(errorDiv);
        
        setTimeout(() => errorDiv.remove(), 10000);
    } finally {
        // Re-enable submit button
        const submitButton = document.querySelector('button[type="submit"]');
        if (submitButton) {
            submitButton.disabled = false;
            submitButton.innerHTML = 'Submit Form';
        }
    }
}
```

## Best Practices

### Performance Optimization

1. **Preload Critical Resources**
   - Use `<link rel="preload">` for fonts and critical CSS/JS
   - Load non-critical scripts with `defer` or `async`

2. **DOM Caching**
   - Cache frequently accessed DOM elements in the `elements` object
   - Avoid repeated `querySelector` calls in loops

3. **Event Delegation**
   - Use event delegation for dynamically added elements
   - Attach listeners to parent containers when possible

### Security Considerations

1. **Input Sanitization**
   - Always trim and validate user input
   - Use `textContent` instead of `innerHTML` for user data

2. **XSS Prevention**
   - Sanitize all user input before displaying
   - Use Content Security Policy headers

3. **Data Protection**
   - Use HTTPS for all webhook submissions
   - Implement timeout controls for fetch requests
   - Handle sensitive data appropriately

### Error Handling

1. **Try-Catch Blocks**
   - Wrap all major functions in try-catch
   - Log errors to console for debugging
   - Provide user-friendly error messages

2. **Graceful Degradation**
   - Check for library availability before use: `if (typeof anime !== 'undefined')`
   - Provide fallback mechanisms for critical features
   - Ensure form works without JavaScript (progressive enhancement)

### Accessibility Requirements

1. **Screen Reader Support**
   ```html
   <!-- Status announcements -->
   <div id="status-message" class="sr-only" role="status" aria-live="polite"></div>
   <div id="error-message" class="sr-only" role="alert" aria-live="assertive"></div>
   ```

2. **Skip Links**
   ```html
   <a href="#main-content" class="skip-link">Skip to main content</a>
   ```

3. **ARIA Attributes**
   - Use `aria-label` for icon buttons
   - Use `aria-describedby` for form field help text
   - Use `aria-required="true"` for required fields
   - Use `role` attributes for custom components

4. **Keyboard Navigation**
   - Ensure all interactive elements are keyboard accessible
   - Maintain logical tab order
   - Provide visible focus indicators

5. **Motion Preferences**
   ```css
   @media (prefers-reduced-motion: reduce) {
       * {
           animation: none !important;
           transition: none !important;
       }
   }
   ```

### Code Organization

1. **Modern JavaScript**
   - Use `'use strict';` mode
   - Use `const` for constants, `let` for variables
   - Use arrow functions for callbacks
   - Use template literals for string interpolation

2. **Function Organization**
   - Group related functions together
   - Use descriptive function names
   - Keep functions focused and single-purpose
   - Document complex logic with comments

3. **Naming Conventions**
   - Use camelCase for variables and functions
   - Use PascalCase for class names
   - Use UPPER_CASE for constants
   - Use descriptive names that indicate purpose

## Implementation Checklist

When creating a new NueSynergy form, ensure:

- [ ] All required CDN libraries are included in `<head>`
- [ ] Color palette matches brand standards (blue + green)
- [ ] Inter font family is loaded
- [ ] Journey Tracker is implemented for multi-step forms
- [ ] Form validation includes conditional field handling
- [ ] Animations are initialized on page load
- [ ] Accessibility features are implemented (screen reader announcements, skip links, ARIA)
- [ ] Webhook integration is configured with fallback
- [ ] LocalStorage auto-save is functional
- [ ] Success animation displays on form submission
- [ ] Error handling is comprehensive
- [ ] Responsive design works on mobile, tablet, and desktop
- [ ] Prefers-reduced-motion is respected
- [ ] All interactive elements have hover states
- [ ] Form works without JavaScript (progressive enhancement)
- [ ] Code follows security best practices

## Migration from Previous Design

This branding guide represents a shift from the previous dark theme (`#000000` background, `#CC5500` accent) to a modern, professional light theme that maintains brand recognition while improving usability and accessibility.

### Key Changes:
- **Background**: Dark theme → Light gradient theme
- **Primary Color**: Orange accent → Blue primary with green accent
- **Typography**: Enhanced hierarchy and improved readability
- **Components**: Added sophisticated hover effects and animations
- **Layout**: More spacious, card-based design with better visual hierarchy
- **Interactivity**: Journey Tracker replaces traditional progress bars
- **Animations**: Anime.js integration for smooth transitions
- **Validation**: Enhanced with conditional field support
- **Accessibility**: Comprehensive screen reader and keyboard support
