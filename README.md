# NueForms - NueSynergy Forms Portal

> **Customer Focused & Technology Driven**

A comprehensive collection of modern, accessible, and user-friendly HTML forms for NueSynergy's employee benefits administration platform. This repository contains production-ready forms for COBRA administration, FSA renewals, contact changes, and more.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Technologies](#technologies)
- [Getting Started](#getting-started)
- [Form Types](#form-types)
- [Branding & Design System](#branding--design-system)
- [Development Guidelines](#development-guidelines)
- [Testing](#testing)
- [Accessibility](#accessibility)
- [Deployment](#deployment)
- [Documentation](#documentation)
- [Support](#support)

---

## 🎯 Overview

NueForms is a collection of premium HTML forms designed for NueSynergy's benefits administration services. Each form features:

- **Modern UI/UX** with smooth animations and transitions
- **Multi-step navigation** with progress tracking
- **Comprehensive validation** with real-time feedback
- **Accessibility compliance** (WCAG 2.1 standards)
- **Responsive design** for all devices
- **Auto-save functionality** to prevent data loss
- **Webhook integration** for seamless data submission

---

## ✨ Features

### Core Features

- 🎨 **Premium Design System** - Consistent branding across all forms
- 🚀 **Smooth Animations** - Powered by Anime.js for delightful interactions
- 📱 **Fully Responsive** - Works seamlessly on desktop, tablet, and mobile
- ♿ **Accessibility First** - Screen reader support, keyboard navigation, ARIA labels
- 💾 **Auto-Save** - LocalStorage-based progress saving (24-hour expiration)
- ✅ **Smart Validation** - Conditional field handling, real-time error feedback
- 🎯 **Progress Tracking** - Interactive journey tracker with visual indicators
- 🔔 **User Feedback** - Tooltips, success animations, error notifications
- 📤 **Webhook Integration** - Secure form submission with fallback mechanisms
- 🎉 **Success Celebrations** - Confetti animations and visual confirmations

### Technical Features

- **No Build Process Required** - Pure HTML/CSS/JavaScript
- **CDN-Based Libraries** - Fast loading, no local dependencies
- **Progressive Enhancement** - Forms work without JavaScript
- **Performance Optimized** - Preloaded resources, cached DOM elements
- **Error Handling** - Comprehensive try-catch blocks and fallback mechanisms
- **Security** - Input sanitization, HTTPS enforcement, timeout controls

---

## 📁 Project Structure

```
nueforms/
├── main.html                          # Main portal landing page
├── add-new-group.html                 # Agency connection form
├── contact-change.html                # Contact information change form
│
├── COBRA/                             # COBRA Administration Forms
│   ├── COBRA-Continuation-Takeover.html
│   ├── COBRA-Initial-Notice.html
│   ├── COBRA-QB-Continuation-Takeover.html
│   ├── COBRA-Term-Notice.html
│   ├── cobra-summary.html
│   └── New-Client-Form.html
│
├── FSA Renewal Pages/                 # FSA Renewal Forms
│   ├── FSA-Admin-Adoption-Agreement.html
│   ├── FSA-Renewal-Form.html
│   └── FSA-Summary.html
│
├── Guides/                            # Documentation
│   ├── branding.md                    # Branding & design system guide
│   ├── DEVELOPER-QUICK-REFERENCE.md   # Developer quick reference
│   ├── README-COBRA-ENHANCEMENTS.md   # COBRA form enhancements guide
│   └── TESTING-GUIDE.md               # Testing procedures
│
└── Testing/                           # Testing utilities & guides
    ├── dynamics-capacity-calculator.html
    ├── Power-Automate-Forms-to-Planner-Guide.html
    ├── Power-Automate-Forms-to-Planner-Guide.md
    ├── Power-Automate-HTTP-Trigger-Quick-Reference.md
    └── Power-Automate-HTTP-Trigger-to-SharePoint-Guide.md
```

---

## 🛠 Technologies

### Core Technologies

- **HTML5** - Semantic markup, form elements, accessibility features
- **CSS3** - Custom properties, gradients, animations, responsive design
- **JavaScript (ES6+)** - Modern JavaScript with strict mode

### Libraries & Frameworks

- **Tailwind CSS** (CDN) - Utility-first CSS framework
- **Anime.js** (CDN) - Lightweight animation library
- **Font Awesome 6.4.0** (CDN) - Icon library
- **Inter Font** (Google Fonts) - Typography
- **Signature Pad** (CDN) - Digital signature capture (where needed)
- **Mermaid.js** (CDN) - Process visualization diagrams (COBRA forms)
- **Tippy.js** (CDN) - Advanced tooltip system (COBRA forms)

### Browser Support

- ✅ Chrome/Edge (latest)
- ✅ Firefox (latest)
- ✅ Safari (latest)
- ✅ Mobile browsers (iOS Safari, Chrome Mobile)

---

## 🚀 Getting Started

### Prerequisites

- Modern web browser
- Web server (for local development) or static hosting
- Text editor or IDE

### Quick Start

1. **Clone or download** this repository
2. **Open any HTML file** in a web browser
   ```bash
   # Example: Open main portal
   open main.html
   ```
3. **For local development**, use a simple HTTP server:
   ```bash
   # Python 3
   python -m http.server 8000
   
   # Node.js (http-server)
   npx http-server -p 8000
   
   # PHP
   php -S localhost:8000
   ```
4. **Navigate** to `http://localhost:8000` in your browser

### Development Setup

No build process or package installation required! All forms are self-contained HTML files with CDN resources.

---

## 📝 Form Types

### Main Portal (`main.html`)

The central hub providing access to all NueSynergy forms and services:
- Contact Changes
- Flexible Spending Account management
- COBRA administration
- Support resources

### COBRA Forms (`COBRA/`)

Comprehensive COBRA administration forms:

- **COBRA-Continuation-Takeover.html** - Continuation coverage takeover
- **COBRA-Initial-Notice.html** - Initial COBRA notice
- **COBRA-QB-Continuation-Takeover.html** - Qualified Beneficiary continuation (enhanced version)
- **COBRA-Term-Notice.html** - Termination notice
- **cobra-summary.html** - COBRA administration summary
- **New-Client-Form.html** - New client onboarding

**Features:**
- Multi-step wizard interface
- Interactive journey tracker
- Process visualization with Mermaid.js
- Contextual tooltips
- Digital signature capture
- File upload support

### FSA Renewal Forms (`FSA Renewal Pages/`)

Flexible Spending Account renewal and administration:

- **FSA-Renewal-Form.html** - Annual FSA renewal
- **FSA-Admin-Adoption-Agreement.html** - Administration adoption agreement
- **FSA-Summary.html** - FSA summary view

**Features:**
- Multi-step form navigation
- Progress tracking
- Auto-save functionality
- Comprehensive validation

### Utility Forms

- **contact-change.html** - Update contact information
- **add-new-group.html** - Agency connection form

---

## 🎨 Branding & Design System

### Color Palette

```css
/* Primary Colors */
--primary-blue: #1E4E6B;          /* Deep blue - headers, primary buttons */
--primary-blue-light: #2a5f7a;    /* Lighter blue - gradients */

/* Accent Colors */
--accent-green: #A4C639;          /* Lime green - highlights, CTAs */
--accent-green-hover: #8fb332;    /* Darker green - hover states */

/* Text Colors */
--text-primary: #2d3748;           /* Main body text */
--text-secondary: #64748b;        /* Secondary text, labels */

/* Background Colors */
--bg-primary: #f0f4f8;            /* Main page background start */
--bg-secondary: #e8f2f6;          /* Main page background end */
--bg-card: #ffffff;               /* Card/section backgrounds */
```

### Typography

- **Font Family**: `'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif`
- **Logo**: 2.5rem, font-weight: 700
- **Form Title**: 1.8rem, font-weight: 600
- **Section Title**: 1.3rem, font-weight: 600
- **Body Text**: 1rem, line-height: 1.6

### Design Principles

1. **Consistency** - All forms follow the same design system
2. **Accessibility** - WCAG 2.1 AA compliance minimum
3. **Performance** - Optimized loading and smooth animations
4. **User Experience** - Clear navigation, helpful guidance, instant feedback
5. **Brand Identity** - Professional, modern, trustworthy

For complete branding guidelines, see [`Guides/branding.md`](Guides/branding.md).

---

## 👨‍💻 Development Guidelines

### Code Standards

- **JavaScript**: Use `'use strict';` mode, ES6+ features
- **CSS**: Use CSS custom properties for theming
- **HTML**: Semantic HTML5, proper ARIA attributes
- **Naming**: camelCase for variables/functions, PascalCase for classes

### Form Development Checklist

When creating a new form, ensure:

- [ ] All required CDN libraries included in `<head>`
- [ ] Color palette matches brand standards
- [ ] Inter font family loaded
- [ ] Journey Tracker implemented (for multi-step forms)
- [ ] Form validation includes conditional field handling
- [ ] Animations initialized on page load
- [ ] Accessibility features implemented (screen reader announcements, skip links, ARIA)
- [ ] Webhook integration configured with fallback
- [ ] LocalStorage auto-save functional
- [ ] Success animation displays on submission
- [ ] Error handling comprehensive
- [ ] Responsive design works on mobile, tablet, desktop
- [ ] Prefers-reduced-motion respected

### Key Functions Reference

```javascript
// Navigation
showStep(n)              // Navigate to step n
nextStep()               // Go to next step (if valid)
prevStep()               // Go to previous step

// Validation
validateStep(n)          // Validate step n, returns boolean

// Data Management
saveCurrentStepData()    // Save current step to formData object
saveProgress()           // Save to localStorage
loadSavedProgress()      // Load from localStorage

// Accessibility
announceToScreenReader(message)  // Polite announcement
announceError(message)            // Assertive announcement

// Animations
animateFieldsIn(element)         // Animate field entrance
animateProgress(percentage)     // Animate progress bar
createConfetti()                // Confetti celebration
```

For detailed developer reference, see [`Guides/DEVELOPER-QUICK-REFERENCE.md`](Guides/DEVELOPER-QUICK-REFERENCE.md).

---

## 🧪 Testing

### Manual Testing Checklist

#### Functionality
- [ ] Fill out form completely
- [ ] Submit successfully
- [ ] Refresh mid-form (data should restore)
- [ ] Clear browser and start fresh
- [ ] Test validation on each step
- [ ] Test conditional field visibility

#### Accessibility
- [ ] Tab through entire form
- [ ] Use skip link (Tab key at page load)
- [ ] Test with screen reader (NVDA/JAWS/VoiceOver)
- [ ] Enable "Reduce Motion" in OS
- [ ] Verify all images have alt text
- [ ] Check color contrast (4.5:1 minimum)

#### Browsers
- [ ] Chrome/Edge (latest)
- [ ] Firefox (latest)
- [ ] Safari (latest)
- [ ] Mobile Safari (iOS)
- [ ] Chrome Mobile (Android)

#### Responsive
- [ ] Desktop (1920px)
- [ ] Laptop (1366px)
- [ ] Tablet (768px)
- [ ] Mobile (375px)

For comprehensive testing procedures, see [`Guides/TESTING-GUIDE.md`](Guides/TESTING-GUIDE.md).

---

## ♿ Accessibility

### Standards Compliance

All forms are designed to meet **WCAG 2.1 Level AA** standards:

- **Color Contrast**: Minimum 4.5:1 for normal text, 3:1 for large text
- **Keyboard Navigation**: All interactive elements accessible via keyboard
- **Screen Reader Support**: ARIA labels, live regions, semantic HTML
- **Focus Management**: Visible focus indicators, logical tab order
- **Motion Preferences**: Respects `prefers-reduced-motion` setting

### Accessibility Features

- Screen reader announcements for form state changes
- Skip links for keyboard navigation
- ARIA labels and descriptions
- Error messages linked to form fields
- Required field indicators
- Form validation feedback

---

## 🚀 Deployment

### Static Hosting

These forms can be deployed to any static hosting service:

- **GitHub Pages**
- **Netlify**
- **Vercel**
- **AWS S3 + CloudFront**
- **Azure Static Web Apps**
- **Traditional web servers** (Apache, Nginx)

### Configuration

1. **Webhook URLs**: Update webhook URLs in form JavaScript before deployment
2. **CORS**: Ensure webhook endpoints allow cross-origin requests
3. **HTTPS**: Use HTTPS for all production deployments
4. **CDN**: Consider using a CDN for improved performance

### Environment Variables

For forms requiring configuration, update these values:

```javascript
// Example webhook configuration
const WEBHOOK_URL = 'https://your-webhook-endpoint.com/submit';
const FORM_VERSION = '1.0';
const EXPIRATION_HOURS = 24; // For localStorage auto-save
```

---

## 📚 Documentation

### Available Guides

- **[Branding Guide](Guides/branding.md)** - Complete design system documentation
- **[Developer Quick Reference](Guides/DEVELOPER-QUICK-REFERENCE.md)** - Code snippets and common tasks
- **[COBRA Enhancements](Guides/README-COBRA-ENHANCEMENTS.md)** - COBRA form feature guide
- **[Testing Guide](Guides/TESTING-GUIDE.md)** - Testing procedures and checklists

### Power Automate Integration

For Microsoft Power Automate integration guides, see the `Testing/` directory:

- Power Automate Forms to Planner Guide
- HTTP Trigger Quick Reference
- HTTP Trigger to SharePoint Guide

---

## 🐛 Troubleshooting

### Common Issues

#### Animations Not Working
- Check browser console for errors
- Verify all CDN libraries loaded
- Test in a modern browser
- Check if user has reduced motion enabled (this is intentional)

#### Form Data Not Saving
- Check browser localStorage is enabled
- Verify not in private/incognito mode
- Check if 24-hour expiration passed
- Look in DevTools → Application → Local Storage

#### Webhook Submission Failing
- Verify webhook URL is correct
- Check CORS settings on webhook endpoint
- Verify network connectivity
- Check browser console for error messages
- Fallback mechanism should activate automatically

#### Validation Errors on Hidden Fields
- Ensure conditional fields use `style.display = 'none'`
- Remove `required` attribute when hiding fields
- Validation function automatically skips hidden fields

---

## 📞 Support

### Contact Information

- **Phone**: 1-800-413-4138
- **Email**: employersupport@nuesynergy.com
- **Website**: [NueSynergy](https://www.nuesynergy.com)

### Getting Help

1. **Check Documentation** - Review guides in the `Guides/` directory
2. **Review Code Comments** - All forms include inline documentation
3. **Browser Console** - Check for JavaScript errors
4. **Test in Different Browsers** - Verify cross-browser compatibility

---

## 📄 License

This project is proprietary software owned by NueSynergy. All rights reserved.

---

## 🎯 Project Goals

- **User Experience**: Create delightful, memorable form experiences
- **Accessibility**: Ensure forms are usable by everyone
- **Performance**: Fast loading and smooth interactions
- **Maintainability**: Clean, well-documented code
- **Consistency**: Unified design system across all forms

---

## 🙏 Acknowledgments

Built with modern web technologies and best practices:
- Tailwind CSS for utility-first styling
- Anime.js for smooth animations
- Font Awesome for icons
- Inter font family for typography

---

**Last Updated**: December 2024  
**Version**: 1.0  
**Maintained by**: NueSynergy Development Team

---

*Customer Focused & Technology Driven* 🚀
