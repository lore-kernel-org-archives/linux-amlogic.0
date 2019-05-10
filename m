Return-Path: <SRS0=BjI6=TK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1168C04A6B
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 08:52:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82CB0216C4
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 08:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="imct1J6m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HC9GwhY1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82CB0216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4736CYot3K3EcSqdlLBH+gMkFbGn/gKU/iqyYZdJcvY=; b=imct1J6ma9K2Ks
	7zaGxJYAirDNQpq77W/fjeKL33epXInpub1ndZX8KaVcRm7mHDA62twDBu9fGwaXM+k99simcPPdu
	vDYBvKrLTQixuKF+K2HW6bZQttNmUoAhBOpntWjsZKoyE34vngaFBaz5Oc9Dh8FwNsFoSVhRc4QRP
	vIxG1R74cBS7qHs7DNYcteBfUmQP0F92txlaqwzXlWW9W3zW3WYDKf2lTFm47zbQ1azR1sjmRCTu7
	vOmtbJhHpb/gbZrZHg5mKKKe44cfwqeq/areZ6B/IrA9nLyEyazGpOGf6iT5hBnCHPQXdF+XmUB74
	pvJmRyJHYdn9CQ+CaVtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP1GN-0006na-6V; Fri, 10 May 2019 08:52:19 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP1GF-0006mq-AB
 for linux-amlogic@lists.infradead.org; Fri, 10 May 2019 08:52:17 +0000
Received: by mail-wm1-x341.google.com with SMTP id h11so6484447wmb.5
 for <linux-amlogic@lists.infradead.org>; Fri, 10 May 2019 01:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=aaM8432jFaEmhAAs5kJRzcW3PtFv9V/mPFGHY/gVINc=;
 b=HC9GwhY1KxcCvquoeRmAWTsEHBkGlMjC2GOSg6QgSOb4NqeO9tQazouSymWwoGOCjA
 9JWrMkzWVeVEGra7oAVM1kJhEEZM/PhqiogQbhTl6twBJtLpQ0/MPg56TCYYAt+Nvv1o
 mCJg3YB/RHexlJfjgBa+KFzqJ5FvXDDHsnnWtvdJONcsi/MDywBvcfou5mimKwOEo1iZ
 aCqw/BkOF0tmUEWP1PK3VYzCYHdrfLvr1cLVaGotwWbUkfqHza9nLRXR4qX182qhGhEq
 TKz1aA9ZIVvYWW+B6qEF292a80KFSQDyuElD+0kAVBqsrRz195OMy7ClsyOwrwFgKNTG
 4aNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=aaM8432jFaEmhAAs5kJRzcW3PtFv9V/mPFGHY/gVINc=;
 b=euovaTSmbAjK40Ggxdv8b26J5Yxwu/JPybWPjxXbPLqKQa5WQC4/U8fznrjU/k+6jP
 /gN1hZs+AXpfj0V5sc9/j4fNdMBZDscGL2lssKq5N3gVQK+JgyeFU1tOXl2QFaVabbwS
 OwACZL1Wg0w0hyynJ4BpnP6siin5Bv1uMjmOJUqrAe6tE9yOl4Zwg1OqPvTJTuj8Fi16
 buPsmve0AgdPTfbj+hZVzxujk7lGaQ5Yi2U5yyl9JjTTe82SCl8SUe7iykkZZYYeFROm
 XnGHtH96ozD/A/0+DhcABXYj7ia/lup2mY/eXih6RLS/1cCH+Jp16NLJeVO6OFMl5p2E
 fPVA==
X-Gm-Message-State: APjAAAUA5GbSQidyPcfZ0RoUuiGwjBF1IH8SxCMw8o14Y9xZ9gyBQNOM
 y9aLtutLIaTDmFSp9KKNrK+VXw==
X-Google-Smtp-Source: APXvYqykj1mHG44y8+cSJrOUjhNqzrgeo1uIXi5+tTVxFFhizSUvTXk2PbGt+OXdLaVSil5RdqYKuA==
X-Received: by 2002:a1c:80d7:: with SMTP id b206mr5910297wmd.48.1557478328921; 
 Fri, 10 May 2019 01:52:08 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d4sm12281121wrf.7.2019.05.10.01.52.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 10 May 2019 01:52:08 -0700 (PDT)
Message-ID: <331673da2c1cad1c72d61b45e0c614961445ec90.camel@baylibre.com>
Subject: Re: [PATCH v5 0/6] Add drive-strength in Meson pinctrl driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guillaume La Roque <glaroque@baylibre.com>, linus.walleij@linaro.org, 
 khilman@baylibre.com
Date: Fri, 10 May 2019 10:52:07 +0200
In-Reply-To: <20190510082324.21181-1-glaroque@baylibre.com>
References: <20190510082324.21181-1-glaroque@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_015211_352203_262C257C 
X-CRM114-Status: GOOD (  18.27  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2019-05-10 at 10:23 +0200, Guillaume La Roque wrote:
> The purpose of this patchset is to add drive-strength support in meson pinconf
> driver. This is a new feature that was added on the g12a. It is critical for us
> to support this since many functions are failing with default pad drive-strength.
> 
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
> So this patch add another generic property "drive-strength-microamp". The change to do so
> would be minimal and could be benefit to other platforms later on.
> 
> Cheers
> Guillaume

Guillaume,

Several tags, such as Acked-by, Reviewed-by or Tested-by have been given on this
series.

Please remember to collect and add them to the commit description when posting newer
revision of a series

If you didn't already, please have a look at Documentation/process/submitting-patches.rst

Thanks

> 
> Changes since v4:
> - fix dt-binding documentation
> - rename drive-strength-uA to drive-strength-microamp in coverletter
> 
> Changes since v3:
> - remove dev_err in meson_get_drive_strength
> - cleanup code
> 
> Changes since v2:
> - rename driver-strength-uA property to drive-strength-microamp
> - rework patch series for better understanding
> - rework set_bias function
> 
> Changes since v1:
> - fix missing break
> - implement new pinctrl generic property "drive-strength-uA"
> 
> [1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com
> 
> Guillaume La Roque (6):
>   dt-bindings: pinctrl: add a 'drive-strength-microamp' property
>   pinctrl: generic: add new 'drive-strength-microamp' property support
>   dt-bindings: pinctrl: meson: Add drive-strength-microamp property
>   pinctrl: meson: Rework enable/disable bias part
>   pinctrl: meson: add support of drive-strength-microamp
>   pinctrl: meson: g12a: add DS bank value
> 
>  .../bindings/pinctrl/meson,pinctrl.txt        |   4 +
>  .../bindings/pinctrl/pinctrl-bindings.txt     |   3 +
>  drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
>  drivers/pinctrl/meson/pinctrl-meson.c         | 180 ++++++++++++++----
>  drivers/pinctrl/meson/pinctrl-meson.h         |  18 +-
>  drivers/pinctrl/pinconf-generic.c             |   2 +
>  include/linux/pinctrl/pinconf-generic.h       |   3 +
>  7 files changed, 193 insertions(+), 53 deletions(-)



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
