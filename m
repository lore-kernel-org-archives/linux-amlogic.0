From: robh@kernel.org (Rob Herring)
Date: Tue, 13 Jun 2017 17:18:59 -0500
Subject: [PATCH v2 1/3] dt-bindings: pwm: meson: add comptabible for gxbb
 ao pwms
In-Reply-To: <20170608122416.1993-2-jbrunet@baylibre.com>
References: <20170608122416.1993-1-jbrunet@baylibre.com>
 <20170608122416.1993-2-jbrunet@baylibre.com>
Message-ID: <20170613221859.5e6wldvyybcav2y4@rob-hp-laptop>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Jun 08, 2017 at 02:24:14PM +0200, Jerome Brunet wrote:
> Add compatible string to properly handle the PWMs found in the AO domain
> of the gxbb (and gxl) family
> 
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-meson.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
