// When 'Generate HTML' button is pressed
document.getElementById('generate').addEventListener('click', generateOutput);

// Preview is updated when there are any changes
window.addEventListener('input', () => {
    // Retrieves selected color
    const color = getHTMLValue('color');
    // Retrieves selected font
    const font = getHTMLValue('font');
    // Retrieves message
    const message = getHTMLValue('text-input');

    // Updates alert preview
    updatePreview(font, color, message);
})

// When copy to clipboard button is clicked
document.getElementById('copy').addEventListener('click', () => {
    // Text field
    const copyText = document.getElementById('text-output');
    
    // Select text field 
    copyText.select();
    // Select text field (for mobile devices)
    copyText.setSelectionRange(0, 99999); 

    // Copy the text inside the text field
    document.execCommand("copy");

    // Alert notifcation
    alert("HTML output copied to clipboard!");
});

/**
 * Retrieves the value from the HTML element. Assumes 
 * the ID is valid and there is a value from the HTML
 * element.
 * @param {string} id The HTML element ID
 * @returns {string} The value of the HTML element 
*/
function getHTMLValue(id) {
    return document.getElementById(id).value;
}

/**
 * Updates preview based on new inputs.
 * @param {string} newFont The new font to use
 * @param {string} newColor The new color to use
 * @param {string} newMsg The new message to use
*/
function updatePreview(newFont, newColor, newMsg) {
    // HTML of preview (non image)
    const preview = document.getElementById('preview');
    
    // Updates preview font
    preview.face = newFont;
    // Updates preview font color
    preview.color = newColor;
    // Updates preview text
    preview.textContent = newMsg;

    // Links for alert picture
    const links = {
        'triangle': 
        {
            'Red': 'https://i.imgur.com/vGhxj4A.png',
            'Blue': 'https://i.imgur.com/XMfhUEw.png',
            'Green': 'https://i.imgur.com/fXQ5Q3i.png',
            'Yellow': 'https://i.imgur.com/JhpBNBA.png'
        }
    }
    // Updates preview picture
    const previewImage = document.getElementsByTagName('img')[0];
    previewImage.src = links.triangle[newColor];
}

/**
 * Generates HTML output based on HTML from preview.
*/
function generateOutput() {
    // HTML to output text
    const output = document.getElementById('text-output');
    
    // Generates HTML output based on preview 
    let HTML = document.getElementsByTagName('img')[0].outerHTML + '\n<br>' + document.getElementById('preview').outerHTML;
    HTML = HTML.replace('/', '');
    HTML = HTML.replace('amp;', '');
    HTML = HTML.replace('https:/', 'https://');
    
    // Updates HTML output
    output.value = HTML; 
}