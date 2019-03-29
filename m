Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A91C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 07:45:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECD382173C
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 07:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KMPX6PEN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECD382173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S/E6f2eSyYfwFPfO5+V6wpqWKqqqGCOtJGPrdC2J7ho=; b=KMPX6PENSl/KzpuSzWEdcaqlG
	fkbNCKsfq6afX6Pnuw5w8vloGlxAK+6AywW2uBHYkhwRHpryhYvoPtU8PeUHDJtYXagAigpuaCWIi
	raiRkSnlMj76SLMOWgHEhOgBrJGCsfKg9dQb6Ui0XkCkYZmCN60II2E6Ck/ScUU6dDe+MXBlxyz8e
	qwGBbAExbJaYdhNSJvio8y/HwlCAcR/zw1FAoaEg+lZu2IwetoASUA0o3I1A8QovzbMjBlADof+j2
	jT4VXtIg0av18VM/DBq/kssw15yOWDy2BKKHWyWODU03qa4gAgnq9j1HjjLsopSSqt8jsdPXOm7m5
	zlnricIfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9mCQ-00052v-Jy; Fri, 29 Mar 2019 07:45:14 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9mC9-0003gw-MD; Fri, 29 Mar 2019 07:44:59 +0000
Received: from [10.28.18.125] (10.28.18.125) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 29 Mar
 2019 15:44:30 +0800
Subject: Re: 32-bit Amlogic (ARM) SoC: kernel BUG in kfree()
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <CAFBinCBOX8HyY-UocsVQvsnTr4XWXyE9oU+f2xhO1=JU0i_9ow@mail.gmail.com>
 <20190321214401.GC19508@bombadil.infradead.org>
 <CAFBinCA6oK5UhDAt9kva5qRisxr2gxMF26AMK8vC4b1DN5RXrw@mail.gmail.com>
 <5cad2529-8776-687e-58d0-4fb9e2ec59b1@amlogic.com>
 <CAFBinCA=0XSSVmzfTgb4eSiVFr=XRHqLOVFGyK0++XRty6VjnQ@mail.gmail.com>
 <32799846-b8f0-758f-32eb-a9ce435e0b79@amlogic.com>
 <CAFBinCDHmuNZxuDf3pe2ij6m8aX2fho7L+B9ZMaMOo28tPZ62Q@mail.gmail.com>
From: Liang Yang <liang.yang@amlogic.com>
Message-ID: <79b81748-8508-414f-c08a-c99cb4ae4b2a@amlogic.com>
Date: Fri, 29 Mar 2019 15:44:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCDHmuNZxuDf3pe2ij6m8aX2fho7L+B9ZMaMOo28tPZ62Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.125]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_004457_971699_4EA81F29 
X-CRM114-Status: UNSURE (   8.49  )
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
Cc: mhocko@suse.com, linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Matthew Wilcox <willy@infradead.org>, rppt@linux.ibm.com, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
 akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On 2019/3/29 2:03, Martin Blumenstingl wrote:
> Hi Liang, 
[......]
>> I don't think it is caused by a different NAND type, but i have followed
>> the some test on my GXL platform. we can see the result from the
>> attachment. By the way, i don't find any information about this on meson
>> NFC datasheet, so i will ask our VLSI.
>> Martin, May you reproduce it with the new patch on meson8b platform ? I
>> need a more clear and easier compared log like gxl.txt. Thanks.
> your gxl.txt is great, finally I can also compare my own results with
> something that works for you!
> in my results (see attachment) the "DATA_IN  [256 B, force 8-bit]"
> instructions result in a different info buffer output.
> does this make any sense to you?
> 
I have asked our VLSI designer for explanation or simulation result by 
an e-mail. Thanks.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
