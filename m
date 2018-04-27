From: robh@kernel.org (Rob Herring)
Date: Fri, 27 Apr 2018 16:53:17 -0500
Subject: [PATCH] dt-bindings: meson-uart: DT fix
 s/clocks-names/clock-names/
In-Reply-To: <1524468760-22912-1-git-send-email-geert+renesas@glider.be>
References: <1524468760-22912-1-git-send-email-geert+renesas@glider.be>
Message-ID: <20180427215317.u4ueypn5vhm5xmcw@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Apr 23, 2018 at 09:32:40AM +0200, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

As this is only binding change, I've applied it.

Rob
