Return-Path: <SRS0=ciOP=AK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24434C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2020 23:20:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E505D206E9
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2020 23:20:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pjwyAtPL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LNTxKl8b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E505D206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=axXLBA+v04Dei1u9RtWcYbqNSWAsC1Rg04OCsLsIbIA=; b=pjwyAtPLr+u04AwKbnjoW6qjl
	fR3RMK7oomhPJSC6kDkQHODNhS2YglbPON6HKR0CYKm+qr0BlTPIWDJ/bMTTwCiP2zxp3N2lNKNRR
	vtn15ycR6yIbV2I81v/tNpAAy2Y8CKF+kTN/xmuRhcg/LMZiPPU3/QuHNIFdQHsWsvVTBTvDkUi42
	LtzLuNylB6HnQlt1vPtl8e9hn3PZbdmVNlBb/tXyKEI/nhi/8gndZc/suaC/Sjqt8cVna5ZTeg1R9
	fakdH7hthviqQIG+kX44eE5iIpphZZFY6LW3Qub53M+GmBLexWMVMqzllsfZ7jFPcHz45H2x6UsS5
	n1cMdrLqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq34E-0006Hs-A2; Mon, 29 Jun 2020 23:20:02 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq344-0006Eq-6F
 for linux-amlogic@lists.infradead.org; Mon, 29 Jun 2020 23:19:53 +0000
Received: by mail-pl1-x62a.google.com with SMTP id x11so7689607plo.7
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2020 16:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5++k/h4J6s9YL0WyWuyzxTlU/vQOJjdsqu0rKb/+Hlw=;
 b=LNTxKl8bebPeFeSx476BYJS3w0hYrs7DOYuvktuSNqJd0fgQiXfpALN3ycAZPoaAKS
 fVFeurobCFOO/sU9O02/7GPD8RNIYmCdnG6tByMjuJgwhDTTevn1BVmpPl3EZwpttui1
 LxANr7G7V/sneGdEhYLNMBgxkV5c0O/UVROia8rANewWhoe+uEoeU4z6e+k28xxQkUhc
 WVHqT891YREel5dJ3r9CaAxkQuYXeTirVcUB1FOdSnjzGLNxu5v6d+GH87OpFIwPVF1P
 7Ft6QKg0JcXfkhrf0aR4fXOoX9La2LqAiX7UBjZN7hzq/TQSyYMsTMwvM/h6/W9iRFfB
 upKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5++k/h4J6s9YL0WyWuyzxTlU/vQOJjdsqu0rKb/+Hlw=;
 b=U2IB8+ahi+9BcYQqIOOahuZv1botcQf52TaXh3bzW9uekd3VJvYvaWKoBQMNjWeBH2
 JY7yEQULloVX6Kg/bLh7mS2CX5IfNksCvdIVJzeHjiD0boE17ec1+s7cwuR1Y1G7CQ/S
 HKGVMCAUjPvW3uiAkeHOWZl0fifLk5Tva5G/HsHOWX+T2VI3MfeLfDd8fk63+MWpozje
 GoQ0wiNQpnxSPVVKvlxyEJt3vTbQBwm12You9DKG7BgOfNl3VCtQS58OOFGx0Gt7AwEc
 fDABJfNqVedVzWi03E5vWLAG61d1uAWBk+cNyT2Hg4Aeq8YOk8EX+uDUfI/LyUPu3QGo
 Ge/Q==
X-Gm-Message-State: AOAM530Ee4xW7nBTupFPu334j2ycjBfCYp71Edysr1+v5qe8o2p1qy3+
 hnQPjpazo1++YNB2bOH7i20unQ==
X-Google-Smtp-Source: ABdhPJzpj4inNHiYiuC/LsoKrrns2nC0r5IQ4v/0MbXa1bNf1SKc3VwcAlkUnq95FV8B+U8X7cTYAQ==
X-Received: by 2002:a17:902:8c89:: with SMTP id
 t9mr15877853plo.14.1593472788532; 
 Mon, 29 Jun 2020 16:19:48 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id l134sm721299pga.50.2020.06.29.16.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 16:19:48 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: meson: Align L2 cache-controller nodename with
 dtschema
Date: Mon, 29 Jun 2020 16:19:45 -0700
Message-Id: <159347276726.1911.11463316462459083306.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626080626.4080-1-krzk@kernel.org>
References: <20200626080626.4080-1-krzk@kernel.org>
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 26 Jun 2020 10:06:26 +0200, Krzysztof Kozlowski wrote:
> Fix dtschema validator warnings like:
>      l2-cache-controller@c4200000: $nodename:0:
>          'l2-cache-controller@c4200000' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'

Applied, thanks!

[1/1] ARM: dts: meson: Align L2 cache-controller nodename with dtschema
      commit: 54320dcaa2522db3222c02d68b52cfed32a2e95b

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
