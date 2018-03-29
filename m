From: sjg@chromium.org (Simon Glass)
Date: Fri, 30 Mar 2018 06:41:31 +0800
Subject: [PATCH] serial: meson: Update compatible with new Linux bindings
In-Reply-To: <1522328162-13786-1-git-send-email-narmstrong@baylibre.com>
References: <1522328162-13786-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ1LME5basLqY1pq7JK_eAvZ4xoyyK8NhNfS2wmWDSFDsg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 29 March 2018 at 20:56, Neil Armstrong <narmstrong@baylibre.com> wrote:
> The Amlogic Meson SoCs serial bindings were not written when serial
> support was pushed into Linux and U-Boot.
> A clean bindings document has been merged into Linux tree to correctly
> handle the multiple clocks feeding the serial peripheral.
> This update the U-Boot serial_meson driver with the new compatible
> string for Amlogic Meson GX Socs.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/serial/serial_meson.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
