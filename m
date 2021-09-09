Return-Path: <SRS0=iK0Q=N7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA5CC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Sep 2021 10:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF6DF611BD
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Sep 2021 10:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF6DF611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4bWUfiVaOK/+P7dwvqRDJBiezGHWlQZGnrheWzUBbo=; b=JzOLwWjcISwAmcyB7Xa2Go+HdR
	oWgK5LUavHlVUYuZcLmP4EohShi290J6g0Vm/MMygPGc/QNRAqNKPc01JuCvuZtHyYLR4LOWCNGRB
	JKqnVrGeViBvbWl5PCcrAbq+R1GWGkYM0O6bEhtiLMCfyJUy/exzLoWbV67gILQLcGTmAaraAfjPE
	OFyc/XAXQqk9uneP0UqS1wuutP33E7OVNI000Pe85txaee7RDeafeqorkkZatE5YY32PHDDNONQAz
	fJMfIubQ7hM7R71FcdjlH1oGvSnTyqjWNoL+lL+pqMMIyPVwxRrZ6BbdlIF9Gh3x3eWXtYnHG7W2a
	n14ASfow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOH4u-008riF-0k; Thu, 09 Sep 2021 10:14:44 +0000
Received: from mx.msync.work ([2a01:4f9:2b:2dc2::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOH4q-008rh6-QI; Thu, 09 Sep 2021 10:14:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 03914E3862; Thu,  9 Sep 2021 10:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1631182478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:
 disposition-notification-to; bh=UtHV6Jt05brS9pYbB9Q5jpcPpg+KZYZgCFNAF9a2mPE=; 
 b=f8ONxOhCamFYg6dvg1zyPdFDJmmZRr6C+/E6DxpsIQLZp6yb2zt8Z+/tiDF21pArGTK5JO
 owhllisCy7RkEbUUTpDO+MeK/cj6sUn2GaMf/oISh/iKEsGKgfKWv8dp+JiWupQ1SZ6Ueq
 wWXvwSi27lWpBiK7m82MrvgQDQYwX/rGoGg8TuQ5ZVIJDvbhmjaGOnLXpUMR8+nH3OsGjl
 FgMIK4CpvSLfvsH/6AHbdLI4qAYSkEwGij7LDX6sSsEDOzzqNDt2rzh+4UvXJGwowdkFyU
 V32et9GsPEBlOlvGvz0BVEn9JPvXtEmJtl2lOmr36gYhEDCIFLH1ygzFHOVw6g==
Subject: Re: [PATCH v4 4/4] arm64: dts: meson-axg: add support for JetHub D1
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210907095603.1520109-1-adeep@lexina.in>
 <20210907095603.1520109-5-adeep@lexina.in>
 <9c6b69e0-0c3b-c1b9-d74a-c66b7bc5b5c6@baylibre.com>
From: Vyacheslav <adeep@lexina.in>
Message-ID: <5f0526f9-38a7-eb51-4e14-e9f931ad135b@lexina.in>
Date: Thu, 9 Sep 2021 13:14:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <9c6b69e0-0c3b-c1b9-d74a-c66b7bc5b5c6@baylibre.com>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_031441_071249_6D1B17C6 
X-CRM114-Status: UNSURE (   9.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

08.09.2021 09:56, Neil Armstrong wrote:
> Hi,
> 
> On 07/09/2021 11:56, Vyacheslav Bocharov wrote:
>> JetHome Jethub D1 (http://jethome.ru/jethub-d1) is a home automation
> 
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Thanks,
> Neil

Thanks.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
