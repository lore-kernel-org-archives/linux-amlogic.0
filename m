Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD2CC76196
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Apr 2023 21:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Subject:
	In-Reply-To:To:From:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ZomCXEClY1B/94cszVtE1gomQwgw2tYACDTFJQLWjY=; b=l7cJ5DHBkFntVb
	KctvUN/ELu1BJpclrLBbPdv6TLDiy4WYxKUqJT5jQh4uuyG2MNh4wSTjEsRxkPQA/3D+IpecAN/65
	iLKlzaoOogvPU2qeYch+Ty/l9O8mi0XTE0pEdk5sJGwEoM5ELiJzQ+K9gcsBucaER88cqHwrTINzR
	2R4WEwzg+fgdu23o4B2dfS4rhT8KmN8a1fD+NUewFfnmSaWt1BX9+bE0bBUyB50GqulK5D63idq1/
	pCKkemeIGQ7Z16wnYesulYFXPTHygVXP4l9zDMRi7EXSDGEJ2/i9a/9NXhhUxmfadsVFdgkrFpc1w
	XSRp0tJXOIqHVLeDNqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piild-00BKs3-2h;
	Sat, 01 Apr 2023 21:28:09 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piilZ-00BKqm-2y
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Apr 2023 21:28:08 +0000
X-KPN-MessageId: 10191c41-d0d4-11ed-97e9-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 10191c41-d0d4-11ed-97e9-005056994fde;
	Sat, 01 Apr 2023 23:27:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=CdNlyw/n+4DkcNjpDrDHcGZHSUE6pLQlIEMctkcfSO4=;
	b=px8DRxRCCMeLEYH50vwdyr/NPt/dFlcUi3pPRz009LRjli1fyY1+zpUmKVUpQ2U/XEREAZSCHNqTL
	 sQzCaCN+smfUzKqJxvzPeTNbKuOxJ7bVLHvi1yQVgbwAdSmjg0oyrhD6zr2XfK56F/o1M/Fjr5vduS
	 nq67la0JXw2IGTxUhlsWfAAWD19ZX+LyVCU3CE8nA20aqKHJ0Dvyhjs6GYgmlgJ+84caqt2rZojzHN
	 UFVvxQSGp8fbK519FXie37KcVgN41EG/P+GyM7aez4u5mOzehOhsRD0Djgh9YGOFVPsqeXPqYOPBkE
	 /gdGWpmVNgYCuynjt6V9BMiK4T/BnJA==
X-KPN-MID: 33|JJNMs740bJIuVxI8c56VZ4chfmxj1MSUBDApydr82XjcTdL1DMV2dmP4EgcN8JL
 Rqv+jv/IIB0DwqFWd3u1cv/vtF2yq9lsbd2w1BFc4Fe0=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|qZdadWIfCIhKJ9gepSgiG8LTFT2dkg/HKp2LDaF/mFMaZy5LYfgTZySaY1o4sdA
 cfXLcDYVK1cEw9Ul3VU45Lg==
X-Originating-IP: 80.61.163.207
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 1298d5e3-d0d4-11ed-9e26-00505699b758;
	Sat, 01 Apr 2023 23:27:58 +0200 (CEST)
Date: Sat, 01 Apr 2023 23:27:58 +0200
Message-Id: <87zg7rb8dd.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Simon Glass <sjg@chromium.org>
In-Reply-To: <20230401185458.2280200-1-sjg@chromium.org> (message from Simon
	Glass on Sun, 2 Apr 2023 06:54:57 +1200)
Subject: Re: [PATCH v2 0/1] meson: Demonstration of using binman to produce the
 image
References: <20230401185458.2280200-1-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_142806_416502_C508F46D 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: neil.armstrong@linaro.org, sjg@chromium.org, u-boot-amlogic@groups.io, u-boot@lists.denx.de, alpernebiyasak@gmail.com, linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> From: Simon Glass <sjg@chromium.org>
> Date: Sun,  2 Apr 2023 06:54:57 +1200
> 
> The Odroid-C2 is quite a complicated image with many steps. It is an ideal
> example for how Binman can be used.

You say Odroid-C2, but the patches seem to address the Odroid-C4...

> Add a binman description and update the instructions accordingly.
> 
> Changes in v2:
> - Rebase to -next
> 
> Simon Glass (1):
>   RFC: Move Odroid-C2 to use binman to produce the image
> 
>  arch/arm/dts/meson-sm1-odroid-c4-u-boot.dtsi | 107 ++++++++++++++++
>  arch/arm/mach-meson/Kconfig                  |   1 +
>  doc/board/amlogic/odroid-c4.rst              | 127 +++++--------------
>  tools/binman/etype/aml_encrypt.py            | 124 ++++++++++++++++++
>  tools/binman/ftest.py                        |   3 +
>  tools/binman/missing-blob-help               |   6 +
>  tools/binman/test/213_aml_encrypt.dts        |  38 ++++++
>  tools/binman/test/214_list_no_dtb.dts        |  23 ++++
>  8 files changed, 337 insertions(+), 92 deletions(-)
>  create mode 100644 tools/binman/etype/aml_encrypt.py
>  create mode 100644 tools/binman/test/213_aml_encrypt.dts
>  create mode 100644 tools/binman/test/214_list_no_dtb.dts
> 
> -- 
> 2.40.0.348.gf938b09366-goog
> 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
