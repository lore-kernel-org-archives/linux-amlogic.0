Return-Path: <SRS0=29RQ=5L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7C0C43331
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 17:58:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1147F2070A
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 17:58:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rA8l0P2H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+xFFnm+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1147F2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ov+LKOVcgN0aeItPMRDSEbOgRJUhFO9TqQqaxCa9WfY=; b=rA8l0P2Hm2LoUz
	Mjs366WcusHfN86W8YpGNahOTl3Qz9lGl9V9DvBDDtKM8bEReWgeGmboxNOD4zCzbr1/O2fPuJRAu
	ff8MXghe/J2ly3tS+xMg48DyvkDWXBZ3gxb0kSxfKHVd3nUHjwrLvOO62Ou5cwUBdoH0FVaifHtAH
	6HZQKZShcXGhywd1HUw8dHGzOD7y2UbcxoWDIF3wXXQ8tQjcJNGUvTNPSMpm0eU5XE4Y3st3/8yBV
	FAXLhEcA2nnm4FSXp7gheMkhGlLoxgWTNVDLrXPKHf3q+CrPlwOXfoc+djGxuOqfiu+DCGTU+emvg
	pD+4Qk+txsZd2Nhk7zHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHWlG-0002KU-UL; Thu, 26 Mar 2020 17:57:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHWlF-0002Js-56; Thu, 26 Mar 2020 17:57:46 +0000
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E6A92070A;
 Thu, 26 Mar 2020 17:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585245464;
 bh=HDcqsps3y7sE+bgHTDL/9DN90HLJP7jG1o+L1gkMqcU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=c+xFFnm+etNnSRJ/Ah2FXe6leOx9wiOBgkJS7CvbgiEZgApTFpZ3/9Cdon8aSqb2g
 p6ZTb53C4xfj63XEAZyIeqabtx5o541mzYHoGP0rQMQUOL2TOlUa0B9TI7xwF3PW0w
 tVkCytw1QKCpW2IuTmyu2BRHJEWwR4Z8p97pPVeQ=
Received: by mail-qv1-f52.google.com with SMTP id g4so3477830qvo.12;
 Thu, 26 Mar 2020 10:57:44 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1B+4qGlFPdIawMCL0WSf00Wn/tD7GH29o/8F1t9iZI07m5tp/f
 Ht6nx/CrlfRb2ZR1OLj+J9CJyLTBOggiqjnPqA==
X-Google-Smtp-Source: ADFU+vtKM5v5e4VeFhzjzjeoNb+xYN0ZFLlxsancYFl7GdsDvmsfoY88t4i3YV+NkEMqB3PBeSG500K8p1dCCg5Gp6M=
X-Received: by 2002:ad4:4829:: with SMTP id h9mr9006254qvy.135.1585245463794; 
 Thu, 26 Mar 2020 10:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200326161046.12111-1-narmstrong@baylibre.com>
In-Reply-To: <20200326161046.12111-1-narmstrong@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 26 Mar 2020 11:57:32 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+zDO3vEkZ5r28_GbnUECo5BfRNFF5PJc9wL0x3mS3FGg@mail.gmail.com>
Message-ID: <CAL_Jsq+zDO3vEkZ5r28_GbnUECo5BfRNFF5PJc9wL0x3mS3FGg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: dwc2: fix bindings for amlogic,
 meson-gxbb-usb
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_105745_218666_1DAB39FC 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: devicetree@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Mar 26, 2020 at 10:10 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The amlogic,meson-gxbb-usb compatible needs snps,dwc2 aswell like other
> Amlogic SoC.
>
> Fixes: f3ca745d8a0e ("dt-bindings: usb: Convert DWC2 bindings to json-schema")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
> index 71cf7ba32237..b7b9ddcbc637 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
> @@ -49,7 +49,9 @@ properties:
>        - items:
>            - const: amlogic,meson8b-usb
>            - const: snps,dwc2
> -      - const: amlogic,meson-gxbb-usb
> +      - items:
> +          - const: amlogic,meson-gxbb-usb
> +          - const: snps,dwc2
>        - items:
>            - const: amlogic,meson-g12a-usb

Perhaps combine at least all the amlogic ones to a single entry.

>            - const: snps,dwc2
> --
> 2.22.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
