Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A67C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:41:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFE22218D0
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 21:41:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vu7hhYUX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dMxOjhEk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFE22218D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfK7Tuc9b2D0BqyA/wOICJCLzYO5Iq0YSkLpmd3Rd+w=; b=Vu7hhYUXiY1Zs1
	TrGrEI4g/SwI6GKN1YjemV3CY5pLdwnsjKuIwjFAVkB0kWmgm0Q3/d/RGU7SP7wCBLJWrZcUtCSNc
	xb9+/oEqaJCHbgQrOxjPAY4UM9sDaS02h012suSojcADuMJP3BUTI/QhYSZtVDbzYRVajn/p3og/j
	deJEaeJRQqvyxN9VSq3bTnSdpIwIDR/A5VRjPEK/BKrcRxDH73OuMMx9ZevGxVrx65picUi16Qvw1
	iR4Aah8Xc5qk4YVIgfDnJiB+Cj2TYiFBcSSsrajYzHcHwvd2wYBoNiOxulvLMUWuqkX5UyHaFvKdm
	CQrdovsoSpnOPLW5q7tQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4uZZ-0006aH-Dk; Fri, 15 Mar 2019 21:41:01 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4uZW-0006Zq-U9; Fri, 15 Mar 2019 21:41:00 +0000
Received: by mail-ot1-x342.google.com with SMTP id r19so9679928otn.1;
 Fri, 15 Mar 2019 14:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EXqZ3fs1h8bFlT1FjQbn+ruBhiy5pxGvGGkBrL+ziZ4=;
 b=dMxOjhEk4RHLmzSLE4lQTZVgN11etrEKqGOjwq7KGk0+9pFT1XdWQWKMoagGEBE4QJ
 9+rwbp0Kyt5hGZhLO7RGq7P8CSKi7A2yb9oD64GPfFfppft4S1pggMfrVbrqk0ejdu1u
 a24bqDOpDx0fCMzM49D6jrAyV8ZdHDP3zX9cM8gaFTEK42No70VIVDJ+sLg+i73+P6Zv
 ZlURBoT1lveOyWzVvHXhHSccRuRRez3S5JRF8gQtagiHwVW7CcznUUDaxaMJtOmvBMJR
 jMLMfqAifqnNSndc+XYGqz64aLjWDj3EV8RatIVhxbggRNOllYFiYVR9rZgmUlL8js+L
 OVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EXqZ3fs1h8bFlT1FjQbn+ruBhiy5pxGvGGkBrL+ziZ4=;
 b=G+dy5UN6w7USgkcvFXaHLP26qBAr6E5YP12jFcjD0r6fFe0OaLHxIIJKadHkK008Gy
 kkuqGeZj7XboawDsHmaHFDZm3PAJxaO6CSfkklD6WW6vzbBvs++QeB8kfMHrh+wg/12J
 tfL0NZ8ZRXVOJxA50NhYRzX0fcTjtdGUnNyDZJSBAz0TGFLpML2S8mBnC4ZeigXMgaaR
 qa1WdxBmTgSGOiIJ0yPS2eEU+ch58ahxwwK6gyvMfr+eoXxDh9pJuVP7w9imZh8ct/um
 0pdxe+7KD3W+TILQCAjJ9ESUW0ASSSFL55tstG8iKrcpITCkU/JKq37mrbApsbIyDXfI
 MoYw==
X-Gm-Message-State: APjAAAXHDghJuv5VeVwOUBMK+dV8nxqSqZ7Xg2tXOank3BFqbbo7QvWW
 gpKd3sIxyoNtaOrGPMUiUoQygJy3buiyvT2SYGI=
X-Google-Smtp-Source: APXvYqzhENjss0YqPjw6E+53BtdMWijwJrgAvTppAV+nr8GYJkrBNwx5gy52zaEakYjdXus+2Mjx3oa5ieJR8DP/umg=
X-Received: by 2002:a9d:6306:: with SMTP id q6mr3433830otk.86.1552686057744;
 Fri, 15 Mar 2019 14:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190307151342.7381-1-narmstrong@baylibre.com>
 <20190307151342.7381-9-narmstrong@baylibre.com>
In-Reply-To: <20190307151342.7381-9-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 15 Mar 2019 22:40:46 +0100
Message-ID: <CAFBinCBC8OcGRSdNTcqPzH6jbWiO1J_9+BcmZmpSJ+uVTjrHUw@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: meson: g12a: Add G12A USB nodes
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_144058_993000_0F7D7A16 
X-CRM114-Status: GOOD (  11.99  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Mar 7, 2019 at 4:15 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This patch adds the nodes for the USB Complex found in the Amlogic
> G12A SoC.
>
> It includes the :
> - 2 USB2 PHYs
> - 1 USB3 + PCIE Combo PHY
> - the USB Glue with it's DWC2 and DWC3 sub-nodes
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +                               g-tx-fifo-size = <128 128 16 16 16>;
I'm not sure about these values but it seems you have already successfully them.
buildroot_openlinux_kernel_4.9_fbdev_20180706 uses the following
values (which are identical to the ones on GXL/GXM, but using the
values below I couldn't get dwc2 to work on GXL when I tried it last):
  dev_tx_fifo_size[0] = 128;
  dev_tx_fifo_size[1] = 128;
  dev_tx_fifo_size[2] = 128;
  dev_tx_fifo_size[3] = 16;
  dev_tx_fifo_size[4] = 16;

Thus I'm still giving my Reviewed-by based on the assumption that the
g-tx-fifo-size values you have are working (at least for you)


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
