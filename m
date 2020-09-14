Return-Path: <SRS0=KQOD=CX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F8FC43461
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2020 22:58:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B85206BE
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2020 22:58:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KQYnPR/l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27B85206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yFRN07FeBvb8r0qsqF/Uj1Yd8hSa9LxJGhNS+gvCoiY=; b=KQYnPR/l/YxiXyvwrWH1KEAAo
	x4vWsPIMIWmAvGqHJY7hNaAIDvK4apKYKduv4oq6usLOOMwk8ucFwsSAPv+GALlI/xLzNccvRZvkx
	VMxbg/Zwa4dzyiqDx/RrtRCg8hnLY2r90y+YtoANN+GCi6QOkqeQEOjqdswpIFgoqy+TSC/Kqd+i3
	tT/or70Ebm/ORtjTd0mK1UuT8w9pzYuyVOmQYXZjuviktn5DQvy9rYgkqEhu37MGt8aNjNUKsNuPX
	yaNHrs59UIJhBv3/eWoEfW/P6/twpdm0xyzxDykA3vcxhPeinFtXOeEjhp3n0bsAouMuRk3Eoko6k
	TahfsfPnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHxQK-0006kP-1T; Mon, 14 Sep 2020 22:58:12 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHxQG-0006jC-RK; Mon, 14 Sep 2020 22:58:09 +0000
Received: by mail-il1-f195.google.com with SMTP id s88so1199368ilb.6;
 Mon, 14 Sep 2020 15:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kq6qlG5VJYZXUU2sGGyka4Jem/75zC6Wn5AvRmVlrlc=;
 b=JUju3WywwzisMi2ZyBVDY81LqdDijhjfHQ1pJNt05kdQNQD3HxHEzT2hjj2tA3J1JF
 MeZyQ8Nk169rm8viRE9RJmc647rPHuz/Qe8sU1E9107BzW0kVbFTYREucSWylsLfAJGo
 TZmE5DUfGWF4kKZ/udF360XhlFHtN9JWvVRAP34PuE1Gzv/IzRIwedLVV07NUUuehC6/
 OTHPuW4qcE8lVaIiuxw2SG7ZZt/VK3g64aWbZlXCDh3ADS8RoMEkKIVM27ZNo4CEyKUn
 1pwAYj6kxnROM0qb/ieeGk5oLeFLs01y/FP5iT8v1sl/ehEYDoziiSQBvU6RkDfVm5GM
 1UXw==
X-Gm-Message-State: AOAM533IWLR9GfjFOuSrU2/Fe3xotCgsOSUQQ5ULX6WIWmhBYRUY0JKW
 Gkg2AUkhGIF8hIr0WWTNDA==
X-Google-Smtp-Source: ABdhPJzjV3LJ6Z9bth40387EREf7eFPmbglblttVdwLb5FiWraVR0VU+a+NG+uwN+G/NZGfVF0l6zQ==
X-Received: by 2002:a05:6e02:be6:: with SMTP id
 d6mr13897302ilu.76.1600124288223; 
 Mon, 14 Sep 2020 15:58:08 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id u14sm7196498ilj.7.2020.09.14.15.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 15:58:07 -0700 (PDT)
Received: (nullmailer pid 427460 invoked by uid 1000);
 Mon, 14 Sep 2020 22:58:06 -0000
Date: Mon, 14 Sep 2020 16:58:06 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH RESEND 1/2] dt-bindings: power: amlogic, meson-ee-pwrc:
 add Amlogic AXG power controller bindings
Message-ID: <20200914225806.GA427430@bogus>
References: <20200904161654.24141-1-narmstrong@baylibre.com>
 <20200904161654.24141-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904161654.24141-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_185808_984895_9A4F9EAB 
X-CRM114-Status: GOOD (  11.42  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 khilman@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 04 Sep 2020 18:16:53 +0200, Neil Armstrong wrote:
> This adds the bindings of the Power Controller found in the Amlogic AXG SoCs.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/power/amlogic,meson-ee-pwrc.yaml | 23 +++++++++++++++++--
>  include/dt-bindings/power/meson-axg-power.h   | 14 +++++++++++
>  2 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/power/meson-axg-power.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
