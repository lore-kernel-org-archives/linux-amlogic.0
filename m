Return-Path: <SRS0=VXFk=4I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B436BC11D04
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 13:28:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86EF0208C4
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 13:28:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WDk2k0LW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETWCB9au"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86EF0208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYJgqBQdYwrk5vNi0sE0cjauv1pQGFjlcF61+HmuRr0=; b=WDk2k0LWodgTqA
	LEcG0U3jh41CvQha5Zkrxahc4P6QQpqjcWZT5ZtUHCUM+dTKqS6NnogLsM7NhZtSTgr+rC8JkX04W
	rkH9pdXdXlcs50JqSMW1lIO8dZWMP8DYXerMKS58oMByx3UNksGgjZ13/VoSich+uoOdeAUNa3/sS
	qIwr6M83kf3x9bLames9/nXPbjZEdCYtdWyLa2PQ85W8RWpy0rCQVnEkvudokWsJUrFziMqDwmF5M
	Nv7xxOtaJwPVzk1BIwD9SLndPAgqlj2bcuMqjqqctz6+Z6a0GYZLjS1AJ0sDvqhtIiSOBlKbAIt9e
	TRZThkBtMGnC5gCIErOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4ls8-0005IE-W8; Thu, 20 Feb 2020 13:28:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4lrw-0004yO-Mp; Thu, 20 Feb 2020 13:27:59 +0000
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1CC2208C4;
 Thu, 20 Feb 2020 13:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582205275;
 bh=LRERjOY5swhgYq3TNDFqarey7d7DB+nwUJMGhi6oW7I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ETWCB9au7GNELIvo2IGphOuMC7YLOuI9PCos8dfJeskBQpqRE9gfhSM/3dYm1hNfQ
 2+spmMhLjQy3O803GwZkQTSPkJ/g6oQqkLq/GAlXUOKsIRrlaqsih03lVpecyg5ceO
 j/kEiaLM42UzlHx+s3/fjdb6NH2uMpau8TVCPWH8=
Received: by mail-qk1-f173.google.com with SMTP id j8so3468041qka.11;
 Thu, 20 Feb 2020 05:27:55 -0800 (PST)
X-Gm-Message-State: APjAAAVLrAn/6hAjJR4qb5XIJmy0UVKeHKa6+r2Ofx8p0sCpyu/XbwL3
 HuZl1GMeFvGOmIXwF81JrxmcsT9jdfnIHAbFQQ==
X-Google-Smtp-Source: APXvYqxZVZomqdZk3IaaKKbZU5jEWBttIla8w6bWDNkZ/rJVdlHm/dja7DRh0sdZhj/Rpu1qHX+SAaGxb8OtZWG18r4=
X-Received: by 2002:a37:6457:: with SMTP id y84mr28648400qkb.254.1582205274941; 
 Thu, 20 Feb 2020 05:27:54 -0800 (PST)
MIME-Version: 1.0
References: <1579087831-94965-1-git-send-email-jianxin.pan@amlogic.com>
 <1579087831-94965-3-git-send-email-jianxin.pan@amlogic.com>
In-Reply-To: <1579087831-94965-3-git-send-email-jianxin.pan@amlogic.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 20 Feb 2020 07:27:43 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJwYChw_S4anOPGhH4r3uwD9SVCnRqa_5BwRvwVicjwrg@mail.gmail.com>
Message-ID: <CAL_JsqJwYChw_S4anOPGhH4r3uwD9SVCnRqa_5BwRvwVicjwrg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] dt-bindings: power: add Amlogic secure power
 domains bindings
To: Jianxin Pan <jianxin.pan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_052756_791029_9777F937 
X-CRM114-Status: GOOD (  16.03  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jan 15, 2020 at 5:30 AM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
>
> Add the bindings for the Amlogic Secure power domains, controlling the
> secure power domains.
>
> The bindings targets the Amlogic A1 and C1 compatible SoCs, in which the
> power domain registers are in secure world.
>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  .../bindings/power/amlogic,meson-sec-pwrc.yaml     | 40 ++++++++++++++++++++++
>  include/dt-bindings/power/meson-a1-power.h         | 32 +++++++++++++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>  create mode 100644 include/dt-bindings/power/meson-a1-power.h
>
> diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> new file mode 100644
> index 00000000..af32209
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +# Copyright (c) 2019 Amlogic, Inc
> +# Author: Jianxin Pan <jianxin.pan@amlogic.com>
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/power/amlogic,meson-sec-pwrc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson Secure Power Domains
> +
> +maintainers:
> +  - Jianxin Pan <jianxin.pan@amlogic.com>
> +
> +description: |+
> +  Secure Power Domains used in Meson A1/C1 SoCs, and should be the child node
> +  of secure-monitor.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-a1-pwrc
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - "#power-domain-cells"
> +
> +examples:
> +  - |
> +    secure-monitor {
> +        compatible = "amlogic,meson-gxbb-sm";
> +
> +        pwrc: power-controller {
> +            compatible = "amlogic,meson-a1-pwrc";
> +            #power-domain-cells = <1>;
> +        };
> +    }

Missing ';':

Error: Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.example.dts:27.5-6
syntax error
FATAL ERROR: Unable to parse input tree

Please fix this as linux-next is now failing dt_binding_check.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
