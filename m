From: robh@kernel.org (Rob Herring)
Date: Wed, 7 Jun 2017 16:13:58 -0500
Subject: [PATCH v5 7/9] pinctrl: meson: update DT binding documentation
In-Reply-To: <7bcb2099-c7e6-e06a-d451-44108f958ef0@gmail.com>
References: <66c57893-0a9e-4f8c-a017-ab346abbdfd0@gmail.com>
 <7bcb2099-c7e6-e06a-d451-44108f958ef0@gmail.com>
Message-ID: <20170607211358.6xn2rnxiov7v2jp4@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, May 30, 2017 at 10:26:53PM +0200, Heiner Kallweit wrote:
> The GPIO controllers act as interrupt controllers now,
> therefore update the related DT binding documentation.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> v5:
> - separate documentation update from actual DT update
> - add Reviewed-by
> ---
>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
