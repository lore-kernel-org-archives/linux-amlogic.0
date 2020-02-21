Return-Path: <SRS0=5fWL=4J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47873C35647
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 10:41:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A7B1222C4
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 10:41:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NvsZKdRQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jFRFDwIW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A7B1222C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1VQ3AyNvEcG04HwZ1qSEKFQ3/ubBQP465DlVfCr9pDA=; b=NvsZKdRQdweN7uSuIuwuctVJ3+
	UoEYwJr1srcilMTSBEkonAcweJV+3kiB13mrv7P/Wf1hLnJvHxUN5TGGOhio1elej3Tbk2/IMXw8j
	g4+uct7lf0eDS7oQP1aBxb3PL4AZmNIP3Afiu4QFJ65qkt3pHDCigMP+hg/KnR81jArr+LKZ6urEx
	PeuqbSNcmFmc1ETwhLxxFSvhs7LWDyxs+zTgrB0VMLGttOgeSTd8D+Gw6fSSGo9NuXfTHgl1LrNiO
	4HG+OvvAIsruisGsaA7lotWIgNJsCjcd5UliTOPeCx6UAcjkaT74Mn6JZnSoFVTPu2PWandFLRCph
	uU4ivGqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j55kC-0007WQ-Dl; Fri, 21 Feb 2020 10:41:16 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j55k9-0007V7-D8
 for linux-amlogic@lists.infradead.org; Fri, 21 Feb 2020 10:41:15 +0000
Received: by mail-wr1-x442.google.com with SMTP id m16so1423439wrx.11
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Feb 2020 02:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=nC38uQjZDz3wMRzUDRjp52c9Hy5uCnGBGkiYQn+GewE=;
 b=jFRFDwIWQUOtcfddu0setQkrtBAAsg+QM4SFFjMIfs1t2qtIm0uY7i8crq9De6BNzc
 Dtmli57wfgiv+8hXV/TFGnq9teiaSzgi8MwR1QQlhBXnc+XRDK0+UQ4NT5WD1X+CDrV+
 sJBDa7KYxgxHPFHz4VxYS/x5pJK+EguZ4u447bTGH5MPg5CdBX3mmARRiypZ7ZyZPr2e
 FKJTapXALLySo1mmmxFw0kI+65Y+YiqMiLgxJ67v6SZEA35vfk0WbL1/9p0xWJ6+W3pn
 BizqQ5sktYD0I+kUvccg9I9+ICSSgWYFz/5SmlbSxoi1InaZoRSpRNS//odmTCwExi2r
 spEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=nC38uQjZDz3wMRzUDRjp52c9Hy5uCnGBGkiYQn+GewE=;
 b=L/EViw/8nCDxZAqfisTp+UnkT/cUZ6MgjF1PmEvaENOjox6VyyHF1P4bED9Qp3lc3G
 hoMYBhpdA6WcJ3A7SJ2Q1Q7fPz5vqHzfJq/QL5lAvzTQfPbfMHGOFZzIGffR8BZpqlRo
 ryx9J1s9gq+Mp4OSoHNfHSnaxnTP58odaFHpmqB0GqI0uBjW3KDCMO4+OxeX0vZJZdoW
 gDnDEU0p+axssxCP5FJmryiWOtVn9svm+Am5/uRzj4ZvfkRH2T66cPZx8pLf+/k6ryGw
 88dU+MKMpvfc9hknosxEJNpkOyX8yx8WuaU8GrVqJBwgTZ/ZUl/Hdn427J3U+bJJbANd
 FgBw==
X-Gm-Message-State: APjAAAXcWAzrEEt8KpmpBM68OAYBs8Sfa4E19neYvLWJPc3hQ2Uu8E80
 1mFBQJmsRUbsYEahNefY8tTBjA==
X-Google-Smtp-Source: APXvYqy2Z7KXJqoiyg14kzMzg6EQiEnMDyNve9Bd9jHVjubhjmti6d9+RBVLDiLaHEsRbCPSAAbbmw==
X-Received: by 2002:adf:a453:: with SMTP id e19mr45872540wra.48.1582281671269; 
 Fri, 21 Feb 2020 02:41:11 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q9sm3437231wrx.18.2020.02.21.02.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 02:41:10 -0800 (PST)
References: <20200220205711.77953-1-martin.blumenstingl@googlemail.com>
 <20200220205711.77953-2-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/3] ASoC: meson: aiu: Document Meson8 and Meson8b support
 in the dt-bindings
In-reply-to: <20200220205711.77953-2-martin.blumenstingl@googlemail.com>
Date: Fri, 21 Feb 2020 11:41:09 +0100
Message-ID: <1jtv3k2pfe.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_024113_439708_58FBAC8E 
X-CRM114-Status: GOOD (  10.23  )
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
Cc: linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org, perex@perex.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 20 Feb 2020 at 21:57, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> The AIU audio output controller on the Meson8 and Meson8b SoC families
> is compatible with the one found in the GXBB family. Document the
> compatible string for these two older SoCs.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  Documentation/devicetree/bindings/sound/amlogic,aiu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml b/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
> index 3ef7632dcb59..a61bccf915d8 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
> @@ -21,6 +21,8 @@ properties:
>        - enum:
>          - amlogic,aiu-gxbb
>          - amlogic,aiu-gxl
> +        - amlogic,aiu-meson8
> +        - amlogic,aiu-meson8b
>        - const:
>            amlogic,aiu


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
