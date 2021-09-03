Return-Path: <SRS0=UeA4=NZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16AAC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Sep 2021 06:05:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A58E56102A
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Sep 2021 06:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A58E56102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tU95IUuaVHSJ2IaJzb0DJWxCXNKFKb0q4r7XsQtnW1M=; b=WLlf2HPt2fMQn171a0AwiFIJ4W
	NqIx/aOLiex3gLQmHNJI2Andi7OQeafAd6UDaTDt3/V7s6Wqvz6dOETstFQd8SN7z8h7iRlTBCxf2
	+aNF5K6qJK3Lncqv+GuQnoawOLz0rCYWDa2ZJ9hvawUiOV7/IMs1+TW5pQXULVzmEDq3RM20rEbM4
	L4jbYZIqKYf/R5fef54YYYjfia0u8IN4R3tFvvAXm4bOcPHPMqEuqbXBeVW3DiIiiOneTFER7fWBw
	zV0Vk+Y71dh4aPbeBKLHAfsVBUUzDywDeY16ED5MV6xhHW4eS0svXWgCMRTTuM2z/d/TQCvjGBqKY
	wX5rZgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM2Kk-00B3Vg-IO; Fri, 03 Sep 2021 06:05:50 +0000
Received: from mx.msync.work ([95.217.65.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM2Kg-00B3Uf-PX
 for linux-amlogic@lists.infradead.org; Fri, 03 Sep 2021 06:05:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 97CF3D5157
 for <linux-amlogic@lists.infradead.org>; Fri,  3 Sep 2021 06:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1630649144; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:
 disposition-notification-to; bh=nG31jNXuozv/EvrrvhxQBGPWCcMd3OsoX2o+HfMBoa4=; 
 b=gpk+nRzO2o/0MPpID1q6Di70ESkQulWRR50oSL97RKC1WnvsLWdqSL9Eayc2xnxP5O8iDG
 kXJ1+egoVDpLfsOBHNuBVlIfNxUvcEFeVyWya6rvS7NmEurpm9m39xEZA5RLj+EiVc6Tby
 lVBtaNmCXQgXN+/wJCdDCk+oIL7DRYRiGxV45bl0tFoKzxjlgz1afMXJDi7QWmSrBA4dcu
 +6XNq5uhlPT9F5zjRY/32GW+NgbJIQzI8J3QcwVNqOXEKQc8LzHCK41xCqWxcq3Mk1ncwO
 PB1qyr8tBCoUaw7uE0YdVPcE+yYx19BTatARHMt84OlmLwoE23XuIDo8nPBVUA==
Subject: Re: [PATCH 1/3] arm64: dts: meson-gxl: add support for JetHub H1
To: linux-amlogic@lists.infradead.org
References: <20210902130516.3892452-1-adeep@lexina.in>
 <20210902130516.3892452-2-adeep@lexina.in>
 <48238ebf-842d-b752-8b9a-f6f408e57dd2@baylibre.com>
From: Vyacheslav <adeep@lexina.in>
Message-ID: <69f0de08-9e34-80cb-668a-a57c880c2e27@lexina.in>
Date: Fri, 3 Sep 2021 09:05:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <48238ebf-842d-b752-8b9a-f6f408e57dd2@baylibre.com>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_230547_043168_55B65546 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

MDIuMDkuMjAyMSAxNjoxOSwgTmVpbCBBcm1zdHJvbmcg0L/QuNGI0LXRgjoKPiBIaSwKPgo+IE9u
IDAyLzA5LzIwMjEgMTU6MDUsIFZ5YWNoZXNsYXYgQm9jaGFyb3Ygd3JvdGU6Cj4+IEpldEhvbWUg
SmV0aHViIEgxIChodHRwOi8vamV0aG9tZS5ydS9qZXRodWItaDEpIGlzIGEgaG9tZSBhdXRvbWF0
aW9uIGNvbnRyb2xsZXIgd2l0aCB0aGUgZm9sbG93aW5nIGZlYXR1cmVzOgo+Pgo+IFRoYW5rcyBm
b3Igc3VibWl0dGluZyBhIG5ldyBib2FyZCAhCgpUaGFua3MgZm9yIGdvb2QgcmV2aWV3LiBJIGhh
dmUgcG9zdGVkIHBhdGNoIHYyLgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
