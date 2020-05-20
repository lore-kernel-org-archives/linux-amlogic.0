Return-Path: <SRS0=iZgZ=7C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A077AC433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 00:09:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB8720825
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 00:09:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PlksWiG7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Un58eWjK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CB8720825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUXB9vzwLqeJwVPTodcej8ojjxE+es/oeIsPAfQG1JM=; b=PlksWiG7f4ueAm
	iiOdzQDa8xbnaqzQEoSoGv95mqJUdLL0qHS00C4oYEltd4XO8TChCZHC3Y1R+2XANvpC+peGqj3vZ
	QJnRJhUlfJ40wW+HBkd0uP2LWMlsTR4m2bY+sk8lMvEzNEafchbU1qFy4XSUAxR6Psh51hQ4iYIXV
	wtpJQJtoslNFkDyXmMOb3pjz2pos+sh7zC4mcfJxvabWz7ma9XcOsG0k8ijkaXgcPuPsB2c8c+53u
	ODu0Q7PYqWKTGbO9alAYIwuGM0zi9XtWtwta6lGGxt1r0SiPTGFnofXg3eoVqYJRzH8DIqIT5/D3A
	nKk+aU1sVn2Kwtfb6OqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbCIM-0001p2-Ep; Wed, 20 May 2020 00:09:14 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbCH3-0000WX-5Y
 for linux-amlogic@lists.infradead.org; Wed, 20 May 2020 00:07:55 +0000
Received: by mail-pj1-x1044.google.com with SMTP id ci23so437326pjb.5
 for <linux-amlogic@lists.infradead.org>; Tue, 19 May 2020 17:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7E+96xLWXR0/8hTuHXZFZz8+gdr1UiuXEJRZqhXw6X8=;
 b=Un58eWjKctefrHRqJ7dvLIb7h0CPEt1iuXzxR4n6qCP42XpGpHDwdTrRBb8PUXaAQg
 RhZKNOwt+EIDA2KgD0SaK8LdZNQoP5sJrMbj7Y7Zq0E0V78tPE0/lRWWYF5QX2c2bikH
 1FIhVCjJGAAbPHuYgUelWXSgf4gKjJSGu3XBaBBsjuZi0BuZ9qdywxDNVGK/AYtr/hOH
 uy9nwtgdpyyFM+uk1CRZCJEn59m+0tfqRpdHwerg5gK1G/Vb+oSrlru5xR86WxFzNat7
 XgZ9n1GZAEuOty9dXFkbRVOcYUXb492Fyay+gUFKaQytL0zjwZ3/Wdd+PczxxDQ/0jjL
 5yFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7E+96xLWXR0/8hTuHXZFZz8+gdr1UiuXEJRZqhXw6X8=;
 b=MGOFB/HpeK3kH0ZLQM9DqDk3PnDGewSIwrzOaNxS4mlww5RL8EDpcvO5kdVXqKx2HN
 ecDERb5lbqJhtRxfajgGUfRTCUt7QUNiFJvN5JEcZfmu6t2nWwg/Tx6H6mMBdMOBMaLr
 g6eEOC+VcOM6FcKAOjAHYQjlK0CwX5DpZTv28bKKrcTHXuTuW3sQUF0bASBupvMieH6e
 1XB2sNGLJG+gWtXO1VOU1MU7I5OEHM3gFYrBVjEOCSF5tWlmobAVwuVC4WU8fzspG4cC
 GLzwM8UInNiKcRogjUlk7bLHRvUiIjCcyiLzYsVitJOjPvlKzqS5YUHM2Fw4O5AqDaKL
 IFGw==
X-Gm-Message-State: AOAM533EJQSL97Dgg7FUvVQGkyMYO4BTGnMHU0Ry0SCDn8t1udjLK45Y
 dvqjlkMWz9+nIDLsVUW50GR46xO/8AnYQw==
X-Google-Smtp-Source: ABdhPJwJXapV3XSyLdWBlyJa/j1Qrxy4J3disNJEFzP9hMGHSRWKAhJBD6HgUG+V+BJQnf+U8c014w==
X-Received: by 2002:a17:90a:2a03:: with SMTP id
 i3mr2158657pjd.29.1589933270413; 
 Tue, 19 May 2020 17:07:50 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id y13sm501497pfq.107.2020.05.19.17.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 17:07:49 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH v8 0/3] arm64: dts: meson: add dts/bindings for SmartLabs
 SML-5442TW
Date: Tue, 19 May 2020 17:07:44 -0700
Message-Id: <158993320300.34448.2467899478322210990.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510124129.31575-1-christianshewitt@gmail.com>
References: <20200510124129.31575-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_170753_279787_1A9C3EC1 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 10 May 2020 12:41:26 +0000, Christian Hewitt wrote:
> This series adds new bindings and a device-tree file for the Smartlabs
> SML-5442TW set-top box which is based on the P231 reference design.
> 
> As requested, I have reworked the device-tree on the p23x-q20x dtsi. I
> have also re-added the BT device with new bindings that have now  been
> merged in bluetooth-next for inclusion in Linux 5.8. See [1].
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: add vendor prefix for Smartlabs LLC
      commit: bc15895e142396fed5ebf1f60139d9ca9a56a4e4
[2/3] dt-bindings: arm: amlogic: add support for the Smartlabs SML-5442TW
      commit: 341e85047bdbc0196c91ccb4612ffab87bae9cfe
[3/3] arm64: dts: meson: add support for the Smartlabs SML-5442TW
      commit: 1d6ece87b750cf26fed4eb794ea0b2fc7ff2be10

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
