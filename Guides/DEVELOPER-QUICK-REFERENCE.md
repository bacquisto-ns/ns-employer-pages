# COBRA Form - Developer Quick Reference

## 🎯 Key Features at a Glance

### Accessibility Features
```javascript
// Announce to screen readers
announceToScreenReader('Your message here');
announceError('Error message here');
```

### Auto-Save System
```javascript
// Automatically saves on step change
// Restores within 24 hours
// Storage key: 'cobraFormProgress'

// Manual save
saveProgress();

// Manual load
const restored = loadSavedProgress();

// Clear saved data
localStorage.removeItem('cobraFormProgress');
```

### Form Validation
```javascript
// Enhanced validation
// - Skips hidden fields automatically
// - Announces errors to screen readers
// - Returns true/false

const isValid = validateStep(currentStep);
```

---

## 🔧 Common Tasks

### Adding a New Form Field

1. **Add HTML field**
```html
<div>
  <label class="block text-sm font-medium text-slate-700">
    Field Label <span class="text-red-500">*</span>
  </label>
  <input 
    name="field_name" 
    required 
    class="mt-1 block w-full rounded-md border-2 border-slate-200 px-3 py-2" 
  />
</div>
```

2. **Field auto-saves automatically** on step change

3. **Validation happens automatically** for required fields

### Making a Field Conditional

```javascript
// Example: Show/hide based on checkbox
document.querySelector('input[name="trigger"]').addEventListener('change', function() {
  const conditionalField = document.getElementById('conditionalField');
  const conditionalInput = conditionalField.querySelector('input');
  
  if (this.checked) {
    conditionalField.style.display = 'block';
    conditionalInput.required = true;
  } else {
    conditionalField.style.display = 'none';
    conditionalInput.required = false;
    conditionalInput.value = '';
  }
});
```

**Important**: The validation function automatically skips hidden fields!

### Adding Screen Reader Announcements

```javascript
// Success message
announceToScreenReader('Action completed successfully');

// Error message
announceError('Please fix the following errors');

// Step change (already automated)
announceToScreenReader(`Step ${n} of ${totalSteps}`);
```

### Adding Custom Animations

```javascript
// Using Anime.js
anime({
  targets: '.your-element',
  opacity: [0, 1],
  translateY: [30, 0],
  duration: 600,
  easing: 'easeOutCubic'
});

// Remember: Respect reduced motion!
// Animations are automatically disabled for users with motion preferences
```

---

## 🎨 Styling Guidelines

### Brand Colors (Use these!)
```css
--ns-blue: #1E4E6B;       /* Primary */
--ns-green: #A4C639;      /* Accent */
--ns-bg: #F0F4F0;         /* Background */
```

### Button Classes
```html
<!-- Primary button -->
<button class="btn-primary">Click Me</button>

<!-- Secondary button -->
<button class="btn-secondary">Cancel</button>
```

### Form Input States
```css
/* Normal - already styled automatically */

/* Error state - added automatically by validation */
.error {
  border-color: #EF4444 !important;
  box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1) !important;
}

/* Focus state - already styled */
input:focus {
  border-color: #A4C639;
  outline: 3px solid rgba(164,198,57,0.4);
}
```

---

## 🐛 Debugging

### Check Auto-Save
```javascript
// In browser console
JSON.parse(localStorage.getItem('cobraFormProgress'));
```

### Clear Saved Progress
```javascript
// In browser console
localStorage.removeItem('cobraFormProgress');
```

### Test Screen Reader Announcements
```javascript
// In browser console - check these elements
document.getElementById('status-message').textContent;
document.getElementById('error-message').textContent;
```

### Verify Form Data Collection
```javascript
// In browser console, before submit
const formData = new FormData(document.getElementById('cobraForm'));
for (let [key, value] of formData.entries()) {
  console.log(key, value);
}
```

---

## ⚠️ Common Pitfalls

### 1. Conditional Fields Not Validating Correctly
**Problem**: Required fields in hidden sections cause validation errors

**Solution**: Already handled! The validation function skips hidden fields. Just make sure to:
```javascript
conditionalField.style.display = 'none';  // Use this
conditionalInput.required = false;        // And this
```

### 2. Screen Reader Not Announcing
**Problem**: Messages not reaching screen readers

**Solution**: Use the provided functions:
```javascript
announceToScreenReader('Your message');  // For status
announceError('Your error');             // For errors
```

### 3. Auto-Save Not Working
**Problem**: Data not persisting between sessions

**Common causes:**
- Browser in private/incognito mode (localStorage disabled)
- More than 24 hours passed (data auto-expires)
- User cleared browser data

**Check**: Look in dev tools → Application → Local Storage

### 4. Animations Not Working
**Problem**: User has reduced motion enabled

**Solution**: This is intentional! Always provide non-animated alternatives. The CSS handles this automatically.

---

## 🧪 Testing Checklist

### Functionality
- [ ] Fill out form completely
- [ ] Submit successfully
- [ ] Refresh mid-form (data should restore)
- [ ] Clear browser and start fresh
- [ ] Test validation on each step
- [ ] Test conditional field visibility

### Accessibility
- [ ] Tab through entire form
- [ ] Use skip link (Tab key at page load)
- [ ] Test with screen reader (NVDA/JAWS/VoiceOver)
- [ ] Enable "Reduce Motion" in OS
- [ ] Verify all images have alt text
- [ ] Check color contrast (4.5:1 minimum)

### Browsers
- [ ] Chrome/Edge (latest)
- [ ] Firefox (latest)
- [ ] Safari (latest)
- [ ] Mobile Safari (iOS)
- [ ] Chrome Mobile (Android)

### Responsive
- [ ] Desktop (1920px)
- [ ] Laptop (1366px)
- [ ] Tablet (768px)
- [ ] Mobile (375px)

---

## 📚 Key JavaScript Functions Reference

### Navigation
```javascript
showStep(n)           // Navigate to step n
nextStep()            // Go to next step (if valid)
prevStep()            // Go to previous step
```

### Validation
```javascript
validateStep(n)       // Validate step n, returns boolean
```

### Data Management
```javascript
saveCurrentStepData() // Save current step to formData object
saveProgress()        // Save to localStorage
loadSavedProgress()   // Load from localStorage
```

### Announcements
```javascript
announceToScreenReader(message)  // Polite announcement
announceError(message)           // Assertive announcement
```

### Tooltips
```javascript
initTooltips()       // Initialize Tippy.js tooltips
```

### Animations
```javascript
animateFieldsIn(element)         // Animate field entrance
animateProgress(percentage)      // Animate progress bar
animateStepTransition(old, new)  // Animate step change
createConfetti()                 // Confetti celebration
```

---

## 🔐 Security Notes

### Input Sanitization
All form data goes through `FormData` API which handles basic sanitization.

### Webhook Submission
- Primary: `fetch()` with 30-second timeout
- Fallback: Hidden iframe submission
- Both methods prevent page navigation

### LocalStorage
- Only stores form field values
- No sensitive data stored
- Auto-expires after 24 hours
- User can clear anytime

---

## 📞 Support

### Questions?
- Review `branding.md` for design standards
- Check `BRANDING-COMPLIANCE-UPDATE.md` for implementation details
- Review inline code comments

### Issues?
- Check browser console for errors
- Verify all CDN resources loaded
- Test in supported browser
- Clear localStorage and try again

---

## 🚀 Performance Tips

### Optimization Already Included
- ✅ Preload critical resources
- ✅ Cache DOM elements
- ✅ Debounced auto-save
- ✅ Hardware-accelerated animations
- ✅ Lazy-load signature pad

### Don't Do This
- ❌ Don't repeatedly query DOM (`querySelector` in loops)
- ❌ Don't add heavy libraries
- ❌ Don't inline large data URIs
- ❌ Don't block main thread

---

## 📖 Learn More

### Technologies Used
- **Tailwind CSS**: Utility-first CSS framework
- **Anime.js**: JavaScript animation library
- **Tippy.js**: Tooltip library
- **Mermaid.js**: Diagram rendering
- **Signature Pad**: Digital signature capture

### Useful Links
- [Anime.js Docs](https://animejs.com/documentation/)
- [Tippy.js Docs](https://atomiks.github.io/tippyjs/)
- [WCAG 2.1 Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [Tailwind CSS](https://tailwindcss.com/docs)

---

*Quick reference for NueSynergy COBRA Form maintenance*
*Updated: October 30, 2025*

