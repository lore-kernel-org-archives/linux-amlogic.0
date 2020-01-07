Return-Path: <SRS0=YAuX=24=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AEBC33C8C
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2020 14:01:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1A602081E
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2020 14:01:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hn0uw4O6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="d098/Ap5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1A602081E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzQcklZQqb6ELjyZAE0Wn5Sos3Tt4eQKd8+/xz8Ocd0=; b=hn0uw4O6h74fGc
	NRyZzSFIwItIaoQSFi21uZcogeIC7VLgnZh898qoXMpyMZOso0pYUB5y0L9Sk89/vp82NEHA8RMvl
	t/r0KI9mKhGT4aus3Y+vx9KZXVDGTkIxEOlcV81MtEMWESQJeMBWyH7nUbSiZBlVffxQA0/FmY9L8
	VblKmHiQjDsw7SAb/8opjF5TZo8dSp6k5HB9bTCXNltkM/Lef/zD7ezFlpA9HuwIYeNX7Ol9EqS0y
	oLUe2yOaz2iHCjoqhwufBe9u/aA0mx6lzDANIkVhZLAGPd+PQbVaZrVIgbOVS/+McimePRdkkYAHT
	bJ1OziJqn4MpAj8yg5uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iopQQ-0006XA-Cn; Tue, 07 Jan 2020 14:01:38 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iopQH-0006Qo-OP; Tue, 07 Jan 2020 14:01:32 +0000
Received: by mail-ed1-x544.google.com with SMTP id v28so50361549edw.12;
 Tue, 07 Jan 2020 06:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1DdkH/5E1tsHkzF5jhXew/z+AFPdpz7/Gvbqbl9G+dg=;
 b=d098/Ap5WZLDYOVx0LUlRnuUilSy+QZyFpM2S+2zMcaSMbQYhJs7Zsv6FI/Ks5jxXv
 dQO2dtGfqCwe9noHFs3y6uhVVyyaaGYPvZwl65t38wPj+hyImcuTHeqj5VyIA4f2lLWb
 UFEa9gC++l0TOhMPwTDLWof0xt/wpRXKZdRfavRYAv8KnTTjshhiZxdDSWfOtyFbT1Bv
 ymkgIQhCEUdCHX9AxIdCz7QsLJrymPx3I4pwcbwTXRCmuq1rwukCSqsog4onHzB8ED3B
 As0e8Ppu27OLG9hHYWl1FLz5+jvWgt0sYgd2BvjO6PTzcD9XD4qEGylhNQzi6oZNCc0p
 +UOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1DdkH/5E1tsHkzF5jhXew/z+AFPdpz7/Gvbqbl9G+dg=;
 b=Ar3mRtvxbxW29VdNWSULqU9Lwto7t2ZXhjT+mpBVSGFew5wtnuCbvgiAfT8IRiZb+r
 ObryAiqBTMat+hfJEDCTbJaEDgY1GUNNTZ2PodilmAN0eh7SwCtBRpAsqPajH2YKsENK
 f/55Rt2wFKkUKSjZU5kqlGzJKwlYXff4C26inm4nvkTggvK8Tjsfo/YjoBZcYjbiQ54w
 1APeMypwPhLhMCLAcdeSAIEpQ1SI2bZUFgH+j110rYdxoOdloEeStVALrsLQLHrbp5zY
 uw63ShAr2FRF5aatxlXHyspXB+HN9BProYeBZk13NLZIX7k2xYHr8+efABbsPMWSzzdg
 XjYw==
X-Gm-Message-State: APjAAAUiHkPnuoUVkT77YdmjYbOAzDv68afx/FOQm/NGusS1BiFvWF5u
 o0J1RiB/LykBxTjpMXtFZWGUBmKDewh775gUGEw=
X-Google-Smtp-Source: APXvYqyj/Sjok9k+8DFvLcnokJSMsKngAK+B55iujYFUBH+0eeHn408PpI8AyVvrp43iXISHPpiSNBLhnBPRapSUjiQ=
X-Received: by 2002:aa7:c80b:: with SMTP id
 a11mr115581083edt.240.1578405684201; 
 Tue, 07 Jan 2020 06:01:24 -0800 (PST)
MIME-Version: 1.0
References: <20191226203655.4046170-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20191226203655.4046170-1-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jan 2020 15:01:13 +0100
Message-ID: <CAFBinCBJwHmQaHMEdZziD=qopqzG6sc2PABkt4E5Hrf927ussQ@mail.gmail.com>
Subject: Re: [RFC v1 0/2] dwmac-meson8b Ethernet RX delay configuration
To: jianxin.pan@amlogic.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_060129_795433_D13B0D7D 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Jianxin,

On Thu, Dec 26, 2019 at 9:37 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The Ethernet TX performance has been historically bad on Meson8b and
> Meson8m2 SoCs because high packet loss was seen. I found out that this
> was related (yet again) to the RGMII TX delay configuration.
> In the process of discussing the big picture (and not just a single
> patch) [0] with Andrew I discovered that the IP block behind the
> dwmac-meson8b driver actually seems to support the configuration of the
> RGMII RX delay (at least on the Meson8b SoC generation).
>
> The goal of this series is to start the discussion around how to
> implement the RGMII RX delay on this IP block. Additionally it seems
> that the RX delay can also be applied for RMII PHYs?
>
> @Jianxin: can you please add the Amlogic internal Ethernet team to this
> discussion? My questions are documented in the patch description of
> patch #2.
do you already have an update for me on this topic?

while we're discussing unknown bits of the Ethernet controller I also
remembered that we're currently not describing the relation between
the "fclk_div2" clock and the Ethernet controller. however, as
described in commit 72e1f230204039 ("clk: meson: meson8b: mark
fclk_div2 gate clocks as CLK_IS_CRITICAL") this is needed for RGMII
mode.
it would be great to know the relation between fclk_div2 and RGMII
mode on the Ethernet controller!


Thank you!
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
