Return-Path: <SRS0=v2ss=SS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93EFC10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 18:33:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 995AF20449
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 18:33:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S2a3JmnU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="AMcn31HH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 995AF20449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5vW5cpS8REZaSU/7/jJJ9J6PH97CjQVHizhsiC7rd1A=; b=S2a3JmnUr0TwLW
	2k1Ev2jgtCCNVaiHlgW5RAvRS4c8eu/fGY77YCD0Jf7giNnE6fR1Nu/ZAJ5A6vMYsYVZBsoj6hvUC
	LxeUDNLOSetHR+ZrTIT4uVYPZtOl0B9mBqX5/Wc7mAHyK4KeoXoHcaSN6EXiqwlYZO6bLRyvFP4vZ
	rVVMxMimfRF+zSTfFG/f0xKK3Xjo+z7+GOGtBUumdBiYtido2yRi7G0CXFhmK7q1PJ1erX1ENTrRv
	WpqpSuhbdefIbG6bOAfoDeSfxnRx0RDMJCSVbdCgKlaaWgddYdQdUAHxS1fG+QTCwuXhO+hKZMe4y
	Z3WsvbJEluKOguWqKB6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGStA-0001ZB-98; Tue, 16 Apr 2019 18:33:00 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGSt6-0001YO-Nv
 for linux-amlogic@lists.infradead.org; Tue, 16 Apr 2019 18:32:58 +0000
Received: by mail-pl1-x641.google.com with SMTP id cv12so10770040plb.9
 for <linux-amlogic@lists.infradead.org>; Tue, 16 Apr 2019 11:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=O2Miq9bX9p2AOkM+k8YxQfNxbc1oH7rmbPVkQaGxjAw=;
 b=AMcn31HHZBQ6o+N/HDXlkCzm1NrYNaR04206fYqcLL2CS/chfNJUCrUfxJ1SPf/7lv
 L+RtCbYpdpJyRYiXEMry4kl2Ck8ne0S0oz1WsbbNNzyfuu3ePEDmDvVcngGbj5LL6gpu
 UsNRtm5ykD3L9n6HPY9bH88mXZzdsHy7QeMZ79Z1HJqh5uHIapN2pU5xFhnihGHae8z4
 5EgKEcAmT6I158cLrMP3fapdA/SicQzwAHuy4/vqZ7Feblq/JVffXwQ+iVtsTA/29pWE
 RIe1EodWZVRy3kS1Qzpj2DmjYa+S6qfBXwDGfq28+C8re+d7UltAe6Lxs+lVJWo6fw9v
 RPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=O2Miq9bX9p2AOkM+k8YxQfNxbc1oH7rmbPVkQaGxjAw=;
 b=KFtOyft0x1VuCG0ha4xGAZmzSQ1TSCShL4eXGgdRhQU9QDLvcMr7yh/BT32sZRfe4e
 ovVKvMjHFLvJCXlhR4exFghEyg2cD4vG5ulZV9sfUWiHwPhMPpjG8rTq5WXj0k4s6l2s
 qndKlaXURqAwpmKLZAjBO3AwUxAxEcEsz95T0a2yC0hHHBTaYR9WTszsCWz2bGhfXF+D
 JEIMezjx+0/XCRjd47LJxT98G8JakXh5VAOmK8aoFihr2nKpMNRF/e5YUoJylRI6kSwb
 ELjd24VpWiGrP+wy82ACQVKbzeuyAHgVReYDeyZAU79rFOhJAhP+A875Is/ii/8vHhPU
 /tuQ==
X-Gm-Message-State: APjAAAXJXiFdd5IjhRqDTWVQHos9EYlTScboCN3q8nykmh4VfzGAce/s
 tzbDH21rjOR0pXhAyHqb5K9QKA==
X-Google-Smtp-Source: APXvYqxqmMT+ESyxM9cZfhnEeqKPm8tj84bnDo9Psbo/3fcuG9MGpFng3Ytrv4o133p59py5bW9zMg==
X-Received: by 2002:a17:902:382:: with SMTP id
 d2mr23050017pld.253.1555439575464; 
 Tue, 16 Apr 2019 11:32:55 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:c45e:7ed8:c242:3563])
 by smtp.googlemail.com with ESMTPSA id
 m16sm127926350pfi.29.2019.04.16.11.32.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Apr 2019 11:32:54 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/5] arm64: dts: meson-g12a: Add support for Video
 Display
In-Reply-To: <20190408093139.27161-1-narmstrong@baylibre.com>
References: <20190408093139.27161-1-narmstrong@baylibre.com>
Date: Tue, 16 Apr 2019 11:32:53 -0700
Message-ID: <7hh8axpzqi.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_113256_842151_78010F84 
X-CRM114-Status: UNSURE (   6.63  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> This patchset adds nodes for Video Display support.
>
> Dependencies :
> - patch 1: VPU, HDMI & Power Controller bindings to be applied

These are applied.

> - patch 2: Depends on AO-CEC-B bindings to be applied

These are reviewed/acked and don't cause build/boot problems.

> - patch 3, 4, 5: Patch 1

Since all the deps are ready, queuing this for v5.2,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
