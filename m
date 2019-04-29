Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5937FC04AA8
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 15:59:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC8D2084B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 15:59:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qOqi5HPx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BC8D2084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cMsBpQYp+9F/XU50SvSZdz6t6tglF08CDnRaDVRSY8=; b=qOqi5HPxST4f/3
	gXe/jxNPkSVf8UZkK3xWENpZgGTg+BzXRIf6S0D4vO9QcniV81nhGeuvlNvv/u2n2D+G7p7XamFDy
	fsiaVQLGL4cRtt46brbcE0cYrviHPqHRyokRz5sR4t6JqRPriHZdVPB/wkPKaLHanpFOubMs0lt1W
	7krfGWJMbF913JRhS4x9ILfVUmFY4mOuF52oIyBymlmkGj59iNxIW1PgXk1bYjDtscxS+D0MbJeww
	fgPtfrwq2q9RouTk2i57urE3JX0curfrykn9qK2aGhkcQvbsllJQdjURc3yE0OsKx3zS/mLu5qo7s
	SNUDOJ+vToasatZ/fqUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL8ge-0001M2-Lq; Mon, 29 Apr 2019 15:59:24 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL8gc-0001Jy-Bs
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 15:59:24 +0000
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MauJJ-1gnRUd2VPH-00cTXC; Mon, 29 Apr 2019 17:59:00 +0200
Subject: Re: [PATCH 37/41] drivers: tty: serial: 8250: simplify io resource
 size computation
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-38-git-send-email-info@metux.net>
 <ba6dd5fa-36f1-902d-1ab4-c99e6a5ea3c2@physik.fu-berlin.de>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <7cec8c1a-a0a1-e76c-5c1f-a93c591d38b1@metux.net>
Date: Mon, 29 Apr 2019 17:58:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <ba6dd5fa-36f1-902d-1ab4-c99e6a5ea3c2@physik.fu-berlin.de>
Content-Language: en-US
X-Provags-ID: V03:K1:CLf6r+MSAE0A4USN6XIxWhLYiiz7bFAjEZVPWrDPzur1ECJt0Dg
 WbYbQxU9nNzapCPvww6NjJvdrqK+oNAJiHa6aeJbsi2v+NNA3fVkvAbLsn9n9KHoQGVfEzu
 N+fU79yInZYR1o784E8xzkrBIVHBDIoXmbRCOVD9oIABn/6VuVCGtjTlkSJlu3jg09HB7dD
 Ufze2K3kEFv4OnGLo+gYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:c27b6UNW+M4=:Grv1CtdyDBcKDa6l5mVHjZ
 /D5eSBrMPo3nbal/qhD4JNTHZyIPmW+9PmXzwasR3bvmu01e4+e2/3REGNSHwZxpkqLIGKodv
 ngYXgywcAOndcT8KE1/CuZofSYrmrAtEKQg5qlBJvr+2yLpZxHva3ZCySbjq4tELVZUuPdKzR
 mEH6F8OQyT3xrEHoSc7e2QtCnWzxPxFbLx0iNnVNMfYEGoWKwVYyxWCWBQfwyRiy8Xls39WN3
 SDVgbyj7EImrGH9tgrtGkiwmjLoL4/Rb+O7KV8WFUCUwFDWfAapwIjNLi4DG1uD5qSVby6tg8
 xebSwSzH897s+7rcBH8fktM61frzzF2LtbCrjUQtxgWEGx8HmSycnqiNvsA8b9j7qHIY7PS2q
 P7j9mNJIltvQ9EZfT6EKeoPPPiKUb7Qxnq/lT1j6urv1655S1aqXVqGiR52p6pxci7e3STqFq
 WLToNwpFIBh0RZPtK0M9x1ljflXL2VYftmJO9JDAV7pDfMAtZq9tFP6PY8qaSELxX4LLivmvk
 PYlcrryV6+L1vAC2u/2tmg4poWrAgzzJi7UHbVCRwJPsx/voMQs4qhjp/yoCaND9PsJR2WD75
 Gi4sG/UZDQuUBmgY0L4oojNnw35PQrvO23nhJNHyzfGWEOdREVFSfAezaxcTHB6jH/olj6znw
 FQyJnUtrLFo04vaUyAW1Ja2Z09d8ocw78d4WnTdL4e95OakfRdw1InQcZq+Ldjbg1Gd6rRu7c
 KFOAwvaPDDf7d09bUPEBh9UlXxdk27dus0wWpVdGd3IBTsygMbjdJgUTyjA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_085922_834450_3FA05A05 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 27.04.19 15:03, John Paul Adrian Glaubitz wrote:
> On 4/27/19 2:52 PM, Enrico Weigelt, metux IT consult wrote:
>> Simpily io resource size computation by setting mapsize field.
>     ^^^^
> Here's a typo

thx. fixed.

--mtx


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
