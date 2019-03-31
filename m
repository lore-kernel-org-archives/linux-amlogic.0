Return-Path: <SRS0=KZtH=SC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1847FC43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 06:41:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D97B521873
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 06:41:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UAQoJRjh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D97B521873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Subject:From:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EsE2fL58d3urvSFz1AVT8wIgKaeUpT4bxk1P4RoXrcI=; b=UAQoJRjhefwShKIQMLnUVMCdpW
	zKRUgubh7swVnRim0PSSa0MKQBEuR7nNYI6MZMbsPGtnpXpT6GyDCrAwCSozfMNmOoAGJ2QfScnRz
	c6V0bERAmUR227VqsWCpPduD+Or/649oAkUyKQd6DUVKAPgJv9ixIM+U4RB1jW5LvNOr17qwibYKv
	tkMKnaDW77VEd3DSe0F3WmzJjeZdTALEYLqda5PRTd/6TLhz4ygOcQtDXHZzi9eq0vmp3ZBrogq7m
	MgL2kL9YenhK1fk/dOfHRQdeac8UM67A14CERbVqWqivS1uxaCPELi21FNL/qKbUba+f2qMmcuHFY
	ARIdxFdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAU9R-0007cS-ED; Sun, 31 Mar 2019 06:41:05 +0000
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAU8w-00077f-Jz; Sun, 31 Mar 2019 06:40:37 +0000
Received: by mail-pl1-f193.google.com with SMTP id g37so2930440plb.5;
 Sat, 30 Mar 2019 23:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:cc:to;
 bh=fhurChVOjxYm5GpP7Zr9zAYKclR5rDuewkb+9pAweUM=;
 b=p2tK7uMmD9MsbX5cMi1BE2qfHeZu9PWFA0xbe4xffxyIhIZ0GFl/eFefovAbyiOv4c
 7hqQeHiYFzLKYwP3zNyCk9WXvbGmPh1OeuPTCjBr6Q4X8B5p7F6LA4xYXS+IBqky52wa
 26tZuyF7XQkiVoqjXurgBbBiuM56TxABt3bJaBjA4R+F8gsoKP9o6E3u04ZDcDeO75/w
 Uw2XTD0t7ibSjXQyEDzh0EbVaoJazM7C6GOQpgKE1a1pw2pczU9yiW7lY+IvvG2YUV82
 gUnwAgWEk+I8mLp7SwPiJOWnelsQlYevJuBnLiZUj4fF+c6+BVLbP3HxQ4BvBhBp1nQH
 mECw==
X-Gm-Message-State: APjAAAUfZ1DxyWlD6RnmjXkI252h6Ehn0QKdpYJGso1icvMDnG7bfxsc
 zijrNZKzS1uTUsteoNTzlg==
X-Google-Smtp-Source: APXvYqw9iljcI8/Bu79YiOeRNIMziMvlbWP7l9y/+8+gxK1ZrB4EO3xFJst6LtssQySP3LRgzS1gmQ==
X-Received: by 2002:a17:902:6aca:: with SMTP id
 i10mr57222982plt.43.1554014433710; 
 Sat, 30 Mar 2019 23:40:33 -0700 (PDT)
Received: from localhost ([210.160.217.68])
 by smtp.gmail.com with ESMTPSA id 4sm7886615pgx.68.2019.03.30.23.40.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 30 Mar 2019 23:40:33 -0700 (PDT)
Message-ID: <5ca060e1.1c69fb81.ce85d.55f2@mx.google.com>
Date: Sun, 31 Mar 2019 01:40:31 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-midgard: Add resets property
References: <20190315135655.28359-1-narmstrong@baylibre.com>
 <20190315135655.28359-2-narmstrong@baylibre.com>
In-Reply-To: <20190315135655.28359-2-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_234035_062404_75B971E4 
X-CRM114-Status: UNSURE (   8.29  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, icenowy@aosc.io
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 15 Mar 2019 14:56:54 +0100, Neil Armstrong wrote:
> The Amlogic ARM Mali Midgard requires reset controls to power on and
> software reset the GPU, adds these as optional in the bindings.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-midgard.txt   | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
