From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Thu, 19 Jan 2017 14:20:25 +0000
Subject: [RFC/RFT PATCH 2/4] drm/bridge: dw-hdmi: Add support for custom
 PHY handling
In-Reply-To: <5efc1cc1-05e4-b763-9b1a-db0859988e7b@baylibre.com>
References: <1484656294-6140-1-git-send-email-narmstrong@baylibre.com>
 <1484656294-6140-3-git-send-email-narmstrong@baylibre.com>
 <88d1f45a-bfd2-2e6b-6c23-2d0686faa2ce@synopsys.com>
 <5efc1cc1-05e4-b763-9b1a-db0859988e7b@baylibre.com>
Message-ID: <5ed16196-4666-d9af-cc5b-51d1a5cebec5@synopsys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,


On 18-01-2017 11:20, Neil Armstrong wrote:
>
> It's the idea we discussed with Laurent.
> Keeping the Synopsys PHY code inside the dw-hdmi driver would be simpler.
>
> But don't you think adding a proper "ops" structure apart from the plat_data
> should be necessary ?
>
> Neil
>

An "ops" structure seems fine by me :) We could have one for the
generic phy's (the ones that dw-hdmi already supports) and let
the developer specify other one if needed.

Best regards,
Jose Miguel Abreu
