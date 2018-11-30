Return-Path: <SRS0=Tn3k=OJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B23C04EB8
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Nov 2018 23:58:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9BD520663
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Nov 2018 23:58:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TSAt4B3p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="1PCw00kJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9BD520663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdE2orDDFOxdxUWFJik/J7xq9Lc0e/Y/BnyvJ52Ralc=; b=TSAt4B3paALLvk
	/uji1kxHIDjZ5ur4o1ZmQtGvvVn/YuhQluQ9GJq6nx8tPqLDScPOMRBDA7Y0pOQDMfvBvqTQtn5vc
	KXjoihx8lLkvFrAzaWWU30j1GGp1U24/TJhN4zw94SaMT0cfX9nOasWWuWmTYzr69ch+ueza3Fa+1
	c7thjhvn/TFs9GbKboInj8qlKpWPerrpIRBp4gQ+CDmrLGzw57U1+EqAnDcgeL6+v0zlvLY1xkSoc
	MHLFmMw/BAAJ9WTpMXkoqE8w7TtLIyYxCWUA0Q+pHVt535y2a0HDTi1bHKX9et1O6MrNQcnZjxivX
	YSXkYbNnyiFutS7B7m8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSsg4-0003d9-CY; Fri, 30 Nov 2018 23:58:32 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSseg-0002DR-QW
 for linux-amlogic@lists.infradead.org; Fri, 30 Nov 2018 23:57:09 +0000
Received: by mail-lj1-x242.google.com with SMTP id x85-v6so6494759ljb.2
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Nov 2018 15:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=h/nTTzZlldYBmRqsGKRdto2uC2xW+Fq0C4IlKRJUb1U=;
 b=1PCw00kJuAlCPmi3lYLDrgPVM/dfVj9QyYZPFjxdxzS1rNFz4rbY1RT8J4gYL3+dLn
 9vZ3Hyhmk0X30aJ+nxqwAAjOjgRx4pbTuT/fq5YdfgJmzUxDCpv+BpZTdmK84a+L6PRW
 MHSKciysmKAnbro5fkiyyleY6gNkJRIG4NAid2qzrMrY/IdBRQuaNwixsNPy5LVcUhFh
 GM8reodAbWbMwh3rgDz1kEOk1+LUhI/FL0v6f1sLWNhvS28aD/PhUpK1eYDfXaGPCQDU
 HXwowJ7ZvAFWMQAtLp06kGenNhH+8nbRc6g664A4BOJjUrC3DGWWvm1Ym/e857JmEVYZ
 Gykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=h/nTTzZlldYBmRqsGKRdto2uC2xW+Fq0C4IlKRJUb1U=;
 b=tPsirQzBPXnSbvOjwd4Nran31NF3ZwRYU3JpniwJbJACzSmiuPz6MFsoSGkJ9Lr9/j
 kFwVet63K2uwsmGcb39aWoHm8omjz0HoeDz0ddsXtl/RXAJFuuzcqpy3lFimHVjNsJ/C
 oufJO7ghdFKNB/1MQH7eZ1XUzuUud6skINmLRAwvkEMta86yzW3s8JexSbDadr7CzWdt
 RdpkTv4b7LPZRoe23QKPQagabyS/p1vixeAcUhYuiGmBNW478ALFJzRGoS9dnsYlcX1P
 bpLl8+9Pf0RxjhNa4SbsBsAi+qp2sDCpOX2/gM3I2exkX16sQeDTesfNAqxgmoLVTEOp
 dBKQ==
X-Gm-Message-State: AA+aEWYEnpru09Iq2BynVTMFq0KUq6MZmD5wHEY0lHvyg2LWetq9ouwu
 4AjJfJtPx3a0MggtSS6mng4NkA==
X-Google-Smtp-Source: AFSGD/U7/GPUnLBlEakj+ArSM0aJdBLEkpY8Ut+NDZgxvSKriZT7pdGoKHNeTKajIRiSEPi9SNX9fA==
X-Received: by 2002:a2e:4a19:: with SMTP id
 x25-v6mr4850470lja.19.1543622221016; 
 Fri, 30 Nov 2018 15:57:01 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id c22-v6sm1034155lji.89.2018.11.30.15.56.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 30 Nov 2018 15:57:00 -0800 (PST)
Date: Fri, 30 Nov 2018 15:18:42 -0800
From: Olof Johansson <olof@lixom.net>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] arm64: dts: Amlogic updates for v4.21
Message-ID: <20181130231842.oqwctiwcwdbirtul@localhost>
References: <7hlg5b8v6u.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7hlg5b8v6u.fsf@baylibre.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181130_155707_348038_E8095C20 
X-CRM114-Status: GOOD (  11.36  )
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

On Thu, Nov 29, 2018 at 12:50:33PM -0800, Kevin Hilman wrote:
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64
> 
> for you to fetch changes up to 5e339a1d7e438b2cc9f46ec9f2682efb58ee2dd3:
> 
>   arm64: dts: meson-gx: Add Internal Clock Measurer node (2018-11-29 12:30:09 -0800)
> 
> ----------------------------------------------------------------
> arm64: Amlogic DT updates for v4.21
> Some highlights:
> - new boards: Phicomm N1 (S905D), Libretech S805-AC
> - fixes for pinmux pad bias, GPIO line names
> - AXG: enable SCPI, add secure monitor

Merged, thanks!


-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
