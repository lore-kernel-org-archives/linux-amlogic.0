Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5C2C04EB8
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Dec 2018 00:10:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C945C20673
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Dec 2018 00:10:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="el7ItIjb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="1AiZYLCm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C945C20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G0mcagxCfoYUBC8Fo8WUT+XtF9+tPTZd5yGuhrZv6uQ=; b=el7ItIjb6cp3Wk
	2XsQpWBav4k1nBIOoRqpB+o0sOAzn8GwMm94OvEFMGe4gXQ3yvo/6zE4T+/ZohiHzgTonc9PDXw37
	zqvZfPu+YRV1qUq1brmPNk0zFPCisoALvjtNyxd5d+6hrtpRloLJS7jMHeDE1QJOopHvnG/69YXLC
	o2BU/wmnteUqH4krADoI62GbIyNQc/AqM56GpQ8IJyFuTvFSgX6Y5QEJNDM08FA9H7ApGIuzEf/kc
	aw0YaKU/nrJXkSZB1XCAzVx4hzT97fA1k+LOvVdJAol6/MnqJ6lvZ7SScz0MppwLqDJeeibf/slAV
	tKVbA9oUbgJu5bhklBWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSsrl-0003jJ-U9; Sat, 01 Dec 2018 00:10:37 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSsel-0002AY-9o
 for linux-amlogic@lists.infradead.org; Fri, 30 Nov 2018 23:57:13 +0000
Received: by mail-lj1-x234.google.com with SMTP id c19-v6so6479472lja.5
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Nov 2018 15:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XNn/2mwE66GLkVAZrtSNd7+nFmPXccWlyyvS58F34js=;
 b=1AiZYLCmvhP0sJeCCJKHoLAdZQUgHMGzWvhCGwQYdV4mNfQOjLN7oo7J5OxTG0ik/w
 00hK5mhWFgTUW7hWVV31TOqVmAO1amVr5DJnNxf2YUXCKY6Ek2fkim+LCued/dfzR5+8
 slL5kQjpQtOQAXsJC83hWeZyQAEh+CkscXBoZ8GiCYvoagQ/vI/BGyGTFuPN/x+zeYFu
 sPAF2YQZhiy/hmsCNYzGwcJz0cTACCcl1PnHXps7gWK7vtHS/zWH6m+m3mtEtlfNWdqE
 40AkG5q4pdmOcJenJoODyrE6pGMqwW8Q3B2Lpzkkz5xdBdWxN9RwCXlWCp/KwUzWSkaY
 gy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XNn/2mwE66GLkVAZrtSNd7+nFmPXccWlyyvS58F34js=;
 b=DkF52bAazl7nc9n4yOu9P2ghh0KM6cow+xIn1pX4gOedPpyIkG8fEAqF+jEX38aRmf
 lLGtlgWpVAeyrW3V9p8QTZoUqtct3DcYzd/Y5ZUuSDVaUDCpjoxKhA8Xuvhui+MpuJEX
 Ux01GPfy20FAuTCZLZ8aaGCouAk03KptvMHDZjg8M2DU6Am3qlx+CdNI3/8/bhKgFz4j
 Vyt/ZWfuYcks13fXhR9nWuXi6495XsalNonkoUgW3dO9GDsUlG+JLG4bDOiTlFNQrZTr
 FiaH9NHLsguyIhV60eupAG3ha0hvSWBRXrp/+IxojP5PxsT8lpSmKRpH9XDA+adJUA3G
 XEKw==
X-Gm-Message-State: AA+aEWZa0vxwda23RbTqt+j7hAj99s/zhHliBrzVA5zpAk6PnB5spWim
 vRPTuUXuk+2Efc5eHMLyLhXurg==
X-Google-Smtp-Source: AFSGD/V6jXn5m2UBo8m3zBlwUTa+cBPmyT68tkQW12/sgPC2p/BIse0TcB8P54BTCTQcZq7vJJrXNQ==
X-Received: by 2002:a2e:449c:: with SMTP id
 b28-v6mr4908613ljf.47.1543622219005; 
 Fri, 30 Nov 2018 15:56:59 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id 1-v6sm999635lju.61.2018.11.30.15.56.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 30 Nov 2018 15:56:58 -0800 (PST)
Date: Fri, 30 Nov 2018 15:18:14 -0800
From: Olof Johansson <olof@lixom.net>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] ARM: dts: Amlogic updates for v4.21
Message-ID: <20181130231814.b7lfebjfipcspnhi@localhost>
References: <7hr2f38v8r.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7hr2f38v8r.fsf@baylibre.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181130_155711_698280_8F1725F4 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: linux-amlogic@lists.infradead.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Nov 29, 2018 at 12:49:24PM -0800, Kevin Hilman wrote:
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt
> 
> for you to fetch changes up to 7b141abe4aa137f362d7324de5a49fd3105f570f:
> 
>   ARM: dts: meson: add the clock inputs for the Meson timer (2018-11-28 16:49:03 -0800)
> 
> ----------------------------------------------------------------
> Amlogic 32-bit DT updates for v4.21
> - support more timers on meson8
> - add the stdout-path property on several boards
> 
> ----------------------------------------------------------------
> Jerome Brunet (1):
>       ARM: dts: meson: consistently disable pin bias
> 
> Martin Blumenstingl (7):
>       dt-bindings: timer: meson6_timer: document all interrupts
>       dt-bindings: timer: meson6_timer: document the clock inputs
>       ARM: dts: meson6: atv1200: add the /chosen/stdout-path property
>       ARM: dts: meson8: minix-neo-x8: add the /chosen/stdout-path property
>       ARM: dts: meson8b: mxq: add the /chosen/stdout-path property
>       ARM: dts: meson: add the TIMER B/C/D interrupts
>       ARM: dts: meson: add the clock inputs for the Meson timer

Merged, thanks!


-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
