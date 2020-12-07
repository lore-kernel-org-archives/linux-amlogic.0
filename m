Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D6DC433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 19:15:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ECAC2342C
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 19:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ECAC2342C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTuguuNHVWXjiqJSa7uOfOYFdwscodaRDNJZC7n7WTE=; b=BRBIUrlWy/2yQ2IOHpDdu5tXDA
	TdqKbvqra73eKfOS/lyfOWH6d2HKrVv9dVqu7M9KEHNpUtEJS2I9PdtnHEAeY8noY8q/ojssur3mn
	5JCrCKXsxME6sh937zFGb8WPtnePjLjN3ZWO07dKn83oWJ5MhSPUXGdvmaCer81LMNVUrmRCjmWOz
	5eKpX4T+stz+1quHB/DTtZ8fEaN3XP0lmWqPsiO602ETHkz47WatvylHUBrTM7cOoJP9P6wgpKfbI
	GYXAiBC0JxrULqtZ0LRD+u9mOe9yLEqtFkbEWkhzGNTzPTVLGERwTjD6evLgB5fgcYgXAeFAP3gN2
	o3Ma7qyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmLz5-0007cO-2m; Mon, 07 Dec 2020 19:15:43 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmLz1-0007a7-AJ
 for linux-amlogic@lists.infradead.org; Mon, 07 Dec 2020 19:15:40 +0000
Received: by mail-pf1-x441.google.com with SMTP id w6so11040334pfu.1
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Dec 2020 11:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=R281r86foH4X6REmvNo1bWa35rW491WPz1BS3w8uDtE=;
 b=h/mR90QN7U002D2Eg3T2GQrffXHyFuVCfTsDraTJiviMXMaclWXZWB/8nEmllhxw4N
 XAwTRDv6/nfrVdP40TClyN9/+07T3iuxZ4P4F2nz0Uy6qbKO7qLVEgkK9vD03T4h9fGi
 4WSVPQyqMGY8TGMaSzFP3Us/0JzLWRFTSdomBlZrxEKXIP5/MHnopT/fRABDIunUZqg9
 NUsj+KV4EmYcX7jwb4b7rfuZn9XOrwSzdTSkvqnfCyVMEeVjG9oy06f+8UqIn0ojg3W9
 7vq58ouwpUTO05r1hY1StSUfpfJx55mTecSiP6jZNVgXw7/98pH4IxD92V7JOza05z3s
 2mCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R281r86foH4X6REmvNo1bWa35rW491WPz1BS3w8uDtE=;
 b=ktQmkhRXK5WTieVFCpRea5Ts782jGrcZrqBU49ebytnj6MHba818hyLPZY4uix1U63
 Rt2x9BXCA5R8t9Q+Goq/96LaLD39AR/V6KYrfdN+5r5JcsVyX2F94xij39szYvDnJ9Bs
 9fRlt6vH6ingB1xO1u0fplFH4SpsLtJZGa72p0tupE8mYB+51nmf5+p0RH84G8D6wvLO
 qBWtd3e6umn1OpzFV/7aeyZw/41wtspP6Pvez3bYWgBh4zJWl14E79U1Pe1OCfTfzcLC
 X63vKG4umDP3FKOwC3AtPNmcg0mqoJ7Pnk554f7GbKblhleGEw30tO1PuYz3J0tmOpDb
 znSA==
X-Gm-Message-State: AOAM531Ruh0rzwQQDgrsFvNH+1pHAFoSAD6bpYINFP/sknqgzTRR8Gea
 fyg7tX453cBZF+m8edosSauB6zHagrtbR9nu
X-Google-Smtp-Source: ABdhPJxsPHdCiXs0qC3DtPPvQxXD5rQIR9X6Yp/ZstsZeVJbY3nmLjIaQmRfifjK4MJzBYv5cGyNzA==
X-Received: by 2002:a65:4c87:: with SMTP id m7mr19491064pgt.75.1607368537114; 
 Mon, 07 Dec 2020 11:15:37 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id w12sm15134149pfn.136.2020.12.07.11.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 11:15:36 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: minor fixups for Khadas VIM/VIM2 dts
Date: Mon,  7 Dec 2020 11:15:32 -0800
Message-Id: <160736852894.39684.13019581328411383803.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201203061605.9603-1-christianshewitt@gmail.com>
References: <20201203061605.9603-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_141539_453316_45C04153 
X-CRM114-Status: UNSURE (   9.31  )
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

On Thu, 3 Dec 2020 06:16:05 +0000, Christian Hewitt wrote:
> Reorder the VIM/VIM2 includes/bindings to follow the format of other dts
> in the Amlogic tree and remove a stray empty line in the VIM2 dts.

Applied, thanks!

[1/1] arm64: dts: meson: minor fixups for Khadas VIM/VIM2 dts
      commit: c993c4e84369acf5686a6f345ebb0efb0107f73e

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
