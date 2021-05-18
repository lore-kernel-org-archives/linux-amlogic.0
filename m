Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B2DC433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 01:34:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0FB061263
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 01:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0FB061263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+HZRqkl99g3pO7amEIbf7wKvx8Zv+JIKCwSDx61gNII=; b=YMJraU9/TI1q4IxKUGEq2HrL6
	6mD+nCV+jwHQKGetJgp0nxOgCRyZR02n00JgLFifEb3Sj2bPgyX/ee1PBsWw3BFrZfYBUdKQ6rzHN
	iT2SVSxKuZuM6C+ujA2/GdWAMj7V7rnbmv1jULhBPkO99EBZJ4+C6sjF0tgYIphBHeduiKiCwuCXd
	Op+kP2b3JVgCZ0SwzZYotoCZ+FHYnhB2Dyu+AX3Etn5SlxxDL0YWbfn5BKQCZ48mvoxn22s82bnmw
	JfxhzfJp20RKfd0UV6dIjeR3ZlYjLA3ffpEcoUs91rBXBbAXDZwvHFRaWrGdHhfw10WDCrDm++M3P
	XJIqtyilA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liocR-00GeJz-6R; Tue, 18 May 2021 01:33:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lioc9-00GeDE-7F; Tue, 18 May 2021 01:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mlVgu0eYtDNlZB69ctdao/DNSc99bQpid/nTdnim50I=; b=kAH7LcoF7Br6x3n5Nma2TPJI+6
 MyYs2U7BZdQM6mejQT8jMuSd2MtvEJqZB0MxT2RVTrWmtRnidaOhXekLpc/ymuzlE36mEcfARQiMr
 GrFdm/KSmcWkQs+83zX3UWLH6YeDFNmevQNdbHOuoe4XGP6YAh5g8xawllevN7yFR/vVb1pua71O5
 LfVWmvEYq9P2UvsAwu+H8ICSmCdbttYktk2QG0LyW2aRpjMgQ2qSW/o9J66cqji3cjm+NAQCbe940
 wuDV0P9NSNbDMkLWh7f2XEgRnUFgfGKkYN+ktcPe/IB2mZia3x7xX6iE3XF5x6ZOAolpSMdxmcOIG
 ZhK7d9VQ==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lioc6-00EG1k-P1; Tue, 18 May 2021 01:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=mlVgu0eYtDNlZB69ctdao/DNSc99bQpid/nTdnim50I=; b=tpNoFPc880mXvPQVZJavVm8ifH
 22Dd1CdKxsNS/dE7hkrb3+EchDQ6ZpyHR7Ht4hDvqys+kAVzA85gUMpVzAKg5TAP0UHRruDhPb7cV
 4+oYMyCOMvWIl6hSbPSWawn5JDgJO86jAHcuckxVXv3DdJocnYpN7Or2kQSXlQLYrx5A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lioc0-004ezc-DP; Tue, 18 May 2021 03:33:32 +0200
Date: Tue, 18 May 2021 03:33:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefan Agner <stefan@agner.ch>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: Random reboots on ODROID-N2+
Message-ID: <YKMZbMA/LFR921zw@lunn.ch>
References: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_183338_827826_42E0B37E 
X-CRM114-Status: GOOD (  10.89  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On Mon, May 17, 2021 at 11:14:18AM +0200, Stefan Agner wrote:
> Hi,
> 
> We are currently testing a new release using Linux 5.10.33. I've
> received since several reports of random reboots every couple of days.
> Unfortunately the log (journald) doesn't show anything, just a hard cut
> at some point.
> 
> After running serial console on several instances, I was able to catch
> this stack trace:
> 
> [202983.988153] SError Interrupt on CPU3, code 0xbf000000 -- SError
> [202983.988155] CPU: 3 PID: 3463 Comm: mdns-repeater Not tainted 5.10.33
> #1
> [202983.988156] Hardware name: Hardkernel ODROID-N2Plus (DT)
> [202983.988157] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
> [202983.988158] pc : udp_send_skb.isra.0+0x178/0x390
> [202983.988159] lr : udp_send_skb.isra.0+0x130/0x390

Hi Stefan

Could you generate net/ipv4/udp.lst so we can see what
udp_send_skb.isra.0+0x178/0x390 is trying to do, and what bit of C
code it maps to.

     Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
