Return-Path: <SRS0=uK5F=7S=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A17C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Jun 2020 14:52:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8E4B206A2
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Jun 2020 14:52:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RoUb6tSq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnfQ95mJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8E4B206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=itCzIcpYPQ27rlVGCCsW6lpP5Qg/8YsH5sgcbofJWS4=; b=RoUb6tSqcdiKBh
	t4lmAeHUlJjfJNBTne7NzlV8xEMZbviVxarEmI9FYoGtnlzDoWScKTmbATqg4aQiQAakQz0x8hp8f
	BgOj6dzcehqknaWypp+6Y2vlU79y8JrT8UScdNHn02gvNSieYwkDUU/KPiXVoIuZ726TU1wlZUsLz
	o5+FT2e6PtY9OoPDISjqicRW9U2DsYV7wNJlHn7h4YXgsZJmWsZf8SQcs/nuO2GunHxiqUCTnZnIw
	3VMc/HjE/BwXf9EOmt5r2dZex6t2m6KQ2NwlRQ42bVik+/FMYMHrB6WQ6kW4FdYCO0YeXlp/Ckvak
	e3K4AqmB1k50HJ3v0rhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhDi5-0001cx-N8; Fri, 05 Jun 2020 14:52:41 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhDi4-0001cQ-0r
 for linux-amlogic@lists.infradead.org; Fri, 05 Jun 2020 14:52:41 +0000
Received: by mail-lj1-x241.google.com with SMTP id n23so12095328ljh.7
 for <linux-amlogic@lists.infradead.org>; Fri, 05 Jun 2020 07:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=DjR+BRrjjtalci39wBcdA56HVuA29gyT3UVh6nsarj8=;
 b=lnfQ95mJh7E1Hg6ls3v24S1UvBZpn6hXsqS/qZMlW+VmtmDproEFqLXogOwXveuaYH
 yFwgHFvoIod/+48KTaB1wgVGxetRmv3aPyAAhj7BgHGY2RpKArtcVrBfzo743o0Aaq9j
 RFiA7KWF5MA5enJhUodwHfq+lyGqPs16W6xtijrdPdfmxbAoL0ihf6v7ymznXL8rzFE2
 QxC+75f84hbHOzEbw1+uiXyPGb1Rh3H5CaBwjREox8QZSsAI/yEwFiploIB81WA56VZ9
 nsh7pxaA4RWbXVtQ0556N6PgpkNW+ekgMmaq1BZSpbOcME+gO+JA0d4HAUf42FUq/A+e
 r3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=DjR+BRrjjtalci39wBcdA56HVuA29gyT3UVh6nsarj8=;
 b=PX3Th3GDuFn2CFACYFUPITv0OAts9GM4nLIhplDu5sMWrlW/PBObbG7uDRUXucZPLs
 tS7KB8Ojwwd/Jl6RI9erKFGqrBmq91GeEhgLpD0hU26dPg3kHo4EkfhwtfuELp6UuC2v
 1E70fKY3jwiNfWYbNh4mvRBJw/5BPEXA66j7ZnUjy5OrnfWoviUzsdbSp/hbgvgPHJpT
 Q/pTPGFupOQtBbAMQYW2k3glcSGLk0MkB9vc8uuA5FCA+KrE7CBODLJEbqxqx+NFLTCG
 NsDyX6zCOWRwNinfovWbr/KDIcSmbBF13uC7y7SWFtuROf49TUdCZ5Du0Vvr0Yd+yafW
 94UA==
X-Gm-Message-State: AOAM533o8L4gSXzRqorY77ZSMM28gnSafZuVVab7+b8u1J+5wvxtuuAh
 CpjaNnkkC6CGIleF49U8WYqwpxtx
X-Google-Smtp-Source: ABdhPJwMkSwOBsyIczcMtyvfR0ZNuEuLrPmkXeFrSHsKHs4EtvioJu3x080o00cALYv2FQJ3PjDHFQ==
X-Received: by 2002:a2e:7610:: with SMTP id r16mr5184669ljc.88.1591368757404; 
 Fri, 05 Jun 2020 07:52:37 -0700 (PDT)
Received: from [192.168.50.104] ([94.158.88.255])
 by smtp.gmail.com with ESMTPSA id v126sm1034388lfa.50.2020.06.05.07.52.36
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jun 2020 07:52:36 -0700 (PDT)
To: linux-amlogic@lists.infradead.org
From: Andrew Ivanchuk <nnk592@gmail.com>
Subject: USB hard drive power reset at kernel boot
Message-ID: <5f12bdfb-fd6f-4726-ddf7-82eac0a0815f@gmail.com>
Date: Fri, 5 Jun 2020 17:52:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_075240_079834_7C014193 
X-CRM114-Status: UNSURE (   6.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

I have an Odroid N2 board (Amlogic S922X SOC). Recently installed 
mainline kernel 5.7-rc6. While in general the system is usable, there is 
an unpleasant issue with a USB hard drive: on kernel boot the power is 
reset to its USB 3.0 port, resulting in an audible hard drive click and 
adding 1 to Power-Off_Retract_Count SMART attribute. There was no such 
problem with Amlogic based 4.9.x kernel.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
