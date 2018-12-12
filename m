Return-Path: <SRS0=dvnd=OV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A5BC6783B
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Dec 2018 21:17:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 816C720851
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Dec 2018 21:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D+TUzTvK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="rahT0ctT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 816C720851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKLm0quo8W9V06F37NdSFzcZ52i5tFOPYaR9kb+yb1w=; b=D+TUzTvKUu3SWr
	pmP6Q6GiUxpYYjA+CyTUu7lM6zet0C1w/1vZQAnqTBfRAQjTzm3J0E+EI1ArJ1t6JXKZUbYsBHPN7
	vigmF/P2Xm1a3NDAeTQeF6kJTGWiJVnoNh3mMIscOW91AlhfCi5TJQt2l3Fg9TbkKltsJmd8hDTY/
	olNX6Kyk4jkHtttRYRLZcrWMuFCf2oZfbaZHDFx6DR2h0lZb/gBTA5hfDyNQyipkK4SU+idXMX+Zl
	PQemDQ5rciMdjmgKFJjhqVw3gzTF+onfmOyfb4Yfd1eOmDkfFXY8Kh9SqVMCyhs8uJJF1VwLzLGkJ
	pOb1U3d9g5hbjwgf9vhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXBsx-0000UD-JT; Wed, 12 Dec 2018 21:17:39 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXBqf-0005dA-4y
 for linux-amlogic@lists.infradead.org; Wed, 12 Dec 2018 21:15:19 +0000
Received: by mail-lj1-x244.google.com with SMTP id v1-v6so17634574ljd.0
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Dec 2018 13:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MQigXgLNMrVjdHttVM8h/wc7o4feonDOnUIY3ArgMWk=;
 b=rahT0ctTpIAKIZ+5HMOJMqMDEA14FV4PTEzWwaQg5Z2P3OQNLqxfOvokQWcUfkKqyZ
 mGjliqyj1xfQ26huoau1gVDUIaJEa9l71Y9KD4m7EghATFnAqTf3jbKmXxNyOm2lclC7
 RfoUtnsGfQUfzaL1g/uLTKLqWwSzo7Graa1gmR3KePtUDuXrx8GZDQ/vOWQ7rNkHqhYc
 PsWYtYXNDIuiJtpfWuUxwE3XM4ZVKYirZNnj62MTkHNahOSmotHkbsrFG/yaflTsAoZ0
 WpArhPUkfg+b3dtQr+Q+JHBzDcopaek8CCQ35pNLZx9uhbbEEb2OQNW17hG6JM1Ez/X0
 ytVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MQigXgLNMrVjdHttVM8h/wc7o4feonDOnUIY3ArgMWk=;
 b=WCpjTkdonF7vjHEDS/dRXuMyEjgL/eyB1o1Sgn3DJp/AivQ2/QlA8sYChMZeCFWO7g
 YdUlYScIG6PEQwOJxjXx8bkRT2jx3UITUZAHPXguc/ZKoCxhr5wu7+6uk+ctK0mCv4tb
 NLra1ZOL4WuYORDmbEj9wy+DKGY315Q2k4/EIHqUriwHXSKXs9fooh3GLMjkGpKr0zZp
 1UFhPaJD4PQw8886ouFfNh/MDzy5ujGV+CRZFL/OIL+GlKSLTNT0gx5cw3eDnudTSy9G
 X/rkbCD9/yGSmp2tnuJw5ZtSVsuIU8uT6Di90srrveIw7THg+AiMXIA5S7CGybcx9SQF
 KyFQ==
X-Gm-Message-State: AA+aEWZUT0vRm4uV/1XfE68pt0ULOfGoed/VsHQk+fgDdlALdbdj6zlz
 +CCy4STs3si7SI9oNgMAu7/mhQ==
X-Google-Smtp-Source: AFSGD/WmduvuYhc6qyfmMz/WEf2BuB9JQ0Zv+NuQEledrYXhPLmaHYN/yTHoy9/rPg1wpuWM6gR7/g==
X-Received: by 2002:a2e:88cf:: with SMTP id
 a15-v6mr12818047ljk.76.1544649311340; 
 Wed, 12 Dec 2018 13:15:11 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id e97-v6sm3511354lji.51.2018.12.12.13.15.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 12 Dec 2018 13:15:10 -0800 (PST)
Date: Wed, 12 Dec 2018 13:03:13 -0800
From: Olof Johansson <olof@lixom.net>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] ARM: dts: Amlogic updates for v4.21, round 2
Message-ID: <20181212210313.nusa2cf2yoravfo2@localhost>
References: <7hbm5tw1it.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7hbm5tw1it.fsf@baylibre.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181212_131517_437638_A981E655 
X-CRM114-Status: GOOD (  13.66  )
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

On Mon, Dec 10, 2018 at 12:49:14PM -0800, Kevin Hilman wrote:
> Arnd, Olof,
> 
> Please consider these updates for v4.21.
> 
> Note that this pull contains a merge of a stable commit from the clock
> tree for a new clock ID.
> 
> Thanks,
> 
> Kevin
> 
> The following changes since commit 7b141abe4aa137f362d7324de5a49fd3105f570f:
> 
>   ARM: dts: meson: add the clock inputs for the Meson timer (2018-11-28 16:49:03 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt-2
> 
> for you to fetch changes up to c311552a8eadf1f9960e6126d23c4bf683ca9ae0:
> 
>   ARM: dts: meson: meson8b: add the CPU OPP tables (2018-12-04 16:48:14 -0800)

Merged, thanks!


-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
