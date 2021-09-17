Return-Path: <SRS0=Z0aL=OH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MISSING_HEADERS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B4EC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Sep 2021 08:14:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AF9760F93
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Sep 2021 08:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AF9760F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:Subject:Reply-To:To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxiegLgTyxiEdx65SclDfZp+DvDnuLNWqyCeUpISgO8=; b=jYkSms1jfj53apscvJskHsVFhn
	DeMPgfTiLSF5bOnZqzHSOBTG/RHW/FLiE9XvtM8rdIOnAJvcCQrgzk/cXmm40psD0pV98pW12OS3H
	8hzpPMYQA5nJOadxI7wx0V9pHlqkBkUzNM2MBiZjEJMEGkylPRef5rBhlXMIkB3cqSsya03Ob0d9g
	2EH27krAdqiQurjknkxjhEVty7zQIBLE6xDyFhJQRMYixfufwh/quVKPLRT+bHgUC2AF9ysKZvxW8
	pmFstv3Sjfc1q31H2tIhvJRbu/nfybWXsf+i44qqBE+uaR5p4nsC1hzfN6I2buTq0fDLfe27JXKXr
	m2jNtZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR91H-00DX2E-K8; Fri, 17 Sep 2021 08:14:51 +0000
Received: from mx.msync.work ([95.217.65.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR91F-00DX1i-0z; Fri, 17 Sep 2021 08:14:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ED37A1073BD; Fri, 17 Sep 2021 08:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1631866006; h=from:subject:date:message-id:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:
 disposition-notification-to; bh=K8pUvKYmihVFtXVo7mlfRJfCXmaPt+xZW7fToK+rFyQ=; 
 b=NkzIUlrcyoaOa6SpQVwrx5j7MONIVEgATiUUOSEdUp5y/Lxuusc5dVnxUPuYeDIDcBBgxs
 YebI7LFHBOQ5b94cH3Y91DWjHpG+39kmu3mY2fBCFhwl5si+2z643RZnm+nKWaL16TfaN1
 D4Gxt8hc8CTLxVDVPvZiw9UZpuoeK8wd9V5fGbS8R45J1W4oZoCmhP8xdxcQoCMj9qMlnO
 6KmBZc2UIt4Qlic7CHfXunJmnqrFl5mNltxOkC0d0cg48j3kAPywgd3a+DhOpMf3mgKTh7
 OFuzfNz2npYHp8O3kHD6/DMUlmnMUaViORjxp3UrsTikQ7/1XyCoPGKTP1MIEQ==
Subject: Re: [PATCH v5 0/4] arm64: meson: add support for JetHub D1/H1
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
References: <20210915085715.1134940-1-adeep@lexina.in>
 <163186366690.1044811.10268335087144036716.b4-ty@baylibre.com>
From: Vyacheslav <adeep@lexina.in>
Message-ID: <24c06118-5eee-055e-e9c6-bbacd6e2eea5@lexina.in>
Date: Fri, 17 Sep 2021 11:06:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <163186366690.1044811.10268335087144036716.b4-ty@baylibre.com>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_011449_342989_A20190DD 
X-CRM114-Status: UNSURE (   8.09  )
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

17.09.2021 10:27, Neil Armstrong wrote:
> Hi,
> 
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.16/dt64)

Thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
