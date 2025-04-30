Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECE4C369D9
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Apr 2025 12:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Message-Id:Date:Mime-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCYHLTsHjEgsmjnuRkXkRaf0ER0GtqmM+634TEBdLhI=; b=r9dKTlYetFHAGI
	KZQaL9JxjSqWERnsolq0yGi2Luznn5cEe6xsz6HY9EU5U8PZIHo4pHCUy1K1I+fk/hOPdypD6yGjb
	P0nMP4+3O8EGoq9hrK6ijtuVT1yxFJvL/nXwGf+klCl2SuSaaKfTndzWqpQbxFzzCn2gmjnTUfeOZ
	Jr6f7wKo4gfKn8vrRyG8/wT3NKALd/EuCTnh/JjjavZPZNetN1TsINJN1MoGFhvUJrVgS8txYXCQs
	i0WUPCMCTE6790DtvBoDCucGGaHERSG7uZp3y4kZvjDspAvNolRIQsFol3aseMdhUn0f/VB4n9Uo5
	GfDuUAeV+OH+u+PNy1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6Gi-0000000Cmrn-1LYJ;
	Wed, 30 Apr 2025 12:10:28 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6G4-0000000Cmjg-07R5
	for linux-amlogic@lists.infradead.org;
	Wed, 30 Apr 2025 12:09:49 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1746014985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVWV9wfVh4aVFFLlnEPoTj/jxHoGB+P5zPI1KTN4fYk=;
	b=eQrHK4e8UiGDDYRETF2imhQ3eOto4wBEvAID/Lq9wp9vQesfscuOY8W8oijQPEpUnRv8r4
	p1g33PZnuJx+TcPdzYjLUWKKOydLGJ5SHZDbdAa9jv8t9p4O7qLfhxkN+EHXhjQ6Fy/m79
	VS4D31OrdJ7Uzwr1fXI2btE/TcyXMzB1xeABK2KSEYjK1pk9hY5gPjNcbbOgPuJlsY+h9J
	jeSFk4QigBli7JNiu40LK7rkX9csNWDAW7uqZwsM7q4h6SV7hqmJ10w2rbpw3a5mXRB0cU
	nUqEJ51iVVouoz+J2dLKJ7sohxcdIMfXTyJaiqLlGZlAxOBkvWzWI+BJDY7Sjw==
Date: Wed, 30 Apr 2025 12:09:26 +0000
Message-Id: <D9JYNEC5E8GG.1ZTHQJ6T939HU@postmarketos.org>
Subject: Re: AML-S905X-CC-V2 emmc issue
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
To: <neil.armstrong@linaro.org>, "Jeff Sacksteder" <jsacksteder@gmail.com>,
 <linux-amlogic@lists.infradead.org>
References: <CAOgeiBY9nLNS8==Z_d4PQQ-Quyp89dSD83ZmuGHOMkFXmd=AWQ@mail.gmail.com> <98628a5e-4f89-4085-9ebd-0a03e3e5de88@linaro.org>
In-Reply-To: <98628a5e-4f89-4085-9ebd-0a03e3e5de88@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_050948_414951_6C85853A 
X-CRM114-Status: UNSURE (   6.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed Apr 30, 2025 at 12:03 PM UTC, neil.armstrong wrote:
>> 
>> However, since I don't have a cross-compile environment available, and
>> it takes 35 hrs to build a kernel, and the Alpine build process is
>> convoluted and weird to me, I would really like to know if that single
>> option is the solution. Otherwise I face multiple 35 hr cycles of
>> building and testing.
>
> 35h !
>
> But why ? you build on an esp32 ?

My i7 CPU from 2011 doesn't build for that long!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
