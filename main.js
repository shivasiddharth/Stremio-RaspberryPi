const { app, BrowserWindow } = require('electron');

app.whenReady().then(() => {
  const win = new BrowserWindow({
    width: 1280,
    height: 720,
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true
    },
    autoHideMenuBar: true
  });

  win.loadURL('http://localhost:11470');
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});
