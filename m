Return-Path: <SRS0=/s/K=YR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF4CCA9EBC
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Oct 2019 20:08:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 702EB20684
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Oct 2019 20:08:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H3vO0/1V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="XhAqLnGm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 702EB20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gx6TMnMFCmQEyst16CMXiIXWQdGuDXfZWDeGTcxM/z4=; b=H3vO0/1VGX/XzJ
	jXoEQP3Dh4Vf/4pxClruxWEIBwxfLh2RPb4UVnaLiTfClo1r/2c2h5UTUG6d+BqB7+2Q3tgp0jkeM
	OBkPU5RupRf/vJ58dLJ9H2gPa+TZfZIkLWqN8T2Rqv7xh3YrgX5xHwXHp8IP8m0YqXn42+8UDCX90
	PqAkLu24ZMGFKbxIgxPvwsjuUlfffeN3qYZyJPCxTiUPWr4betHWVjVwfndIgHrP52HfJUsOCATA+
	wrlf/JZbTGTPpBpiQi/ZnrEr1d5OHoBCHOXm6J59huOcubHWbPH7+Znf2YVjLsfP5Jlotwc2RCAbr
	JsqtKTZrNAeA8dVoyYmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNjPZ-0005NX-7A; Thu, 24 Oct 2019 20:08:45 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNjPW-0005N6-TW; Thu, 24 Oct 2019 20:08:44 +0000
Received: by mail-ot1-x342.google.com with SMTP id z6so137451otb.2;
 Thu, 24 Oct 2019 13:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kd4rux9zK4/dM1SoU+NCgZWD5uCiq/LTC7LQfOYrfr0=;
 b=XhAqLnGm3J5Jx1lfeFRMdzlU0nfgbFU+iE1Zm2bKYj3FLDYtF1ll73kFibNsIash/e
 LiAtAgv3LFU+6O5pNwmOABP5Q8o8fWMMXn3k2nkHyhUiYIUm+GUTJo22elEo+guAHtPE
 TBKU9Tt+RMs1XWZfbjQEARoP4taKCy7aNJtMGmN/0keHFmoHOarA6qyupKoScvuzQMPu
 QYhNzVA3U0OSAjxYf4EHekwScAJoeZdehS6kdght/YPx2wWadiDZyEJcTQfAYv+vNS1Q
 n4u4szJc9tLXHeMRQ6aHq905bp8XVHbbuWyXYk46uzzto0V5th3DIzDm94efmXXcHzOG
 u5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kd4rux9zK4/dM1SoU+NCgZWD5uCiq/LTC7LQfOYrfr0=;
 b=SkpidXjsWfU7GUUZQZItGcs1s8Wj9f6DyWOxim36gbKj8Tq/fECZ0Yg6V+05cLLf0/
 7yCaNR1Fjmyn+6gnQb2wrATkMVTTGQk6YIwexanaNaZtHFGjrKiYqPGukESzet5fBsdr
 szi8yqcVEl1xRcvFOU7mylAQOhX8SosBL6RBr3hwPTxTU7CkT4f8o8E7USWy5oksxg9t
 OGXTaLTByQuK72fe1jzkkOihzjz2Ae0G30iZHTP8Qng98vK1Hygq52c/vXPZExWMncvy
 M+itQ7QoaAVfmVKGDBRpwdqMXqEae4dNPwIJ9vtfu1MOt7+tFnDcH8w5nCfr/0xtlf9K
 kWIA==
X-Gm-Message-State: APjAAAWcHZmGASReCPoBdrMB8TiBTqNS1G9nAegnd4XUNMXc056UWK07
 WGl880qv3SX1t6uA9cTTFTu+XvwBjDof7g/rqsE=
X-Google-Smtp-Source: APXvYqz84I0v7XTW8iDg6npWUg0bkWh5xFxmoF+OiWXABrvJLf217zrAxoylNNyEKiBYAHSZa6iAxuz1xcNzIGJY0b8=
X-Received: by 2002:a9d:3675:: with SMTP id w108mr13346820otb.81.1571947722161; 
 Thu, 24 Oct 2019 13:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191021133950.30490-1-narmstrong@baylibre.com>
In-Reply-To: <20191021133950.30490-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 24 Oct 2019 22:08:31 +0200
Message-ID: <CAFBinCBFPLx0KTGb8D5FRus=hYMriYQ-jKSENyVpzwWpT+g2yw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: soc: amlogic: canvas: convert to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_130842_954840_C378A74D 
X-CRM114-Status: GOOD (  11.77  )
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
Cc: mjourdan@baylibre.com, devicetree@vger.kernel.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Oct 21, 2019 at 3:40 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic Canvas over to a YAML schemas.
>
> Cc: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
one nit-pick below, but I leave it up to Maxime to decide whether it's needed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.yaml
> new file mode 100644
> index 000000000000..4322f876753d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/amlogic/amlogic,canvas.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Canvas
personally I prefer "Amlogic Canvas Video Lookup Table" because that's
also what we use (abbreviated as video-lut) for the node name


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
