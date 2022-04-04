Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE97C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 10:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQPRj5zGdFC6pja3OOBZWPOZeqqahEW0Z82pN/Ig1vo=; b=JkJpNIAcQoTjMWXOCTlxbM4Eqs
	APbY3HsVSG9IcKQZZHyWCkyqTw/97Y1YqfFpOhLNzPCO9/B5+q/yr+yWFGEDK4yfpPIOwytnuZSJ0
	uEhM6d3jO4ue0IKXyBMCvAYEqZUvMdUKZQS+uQCuE4ieyDHi5VH5niJ5zx6wyvs1dVcWOdVWaXJxG
	xQQcAWQYsavtXB+ByQygKKwl681O3hbOfdF2EVY25AbYnYs9KqCK2TerDhAs2cwRvNRw4FAycjd/S
	/yyxxBoADCHXky7dGIo71FLH99mmeELBkKwLWHgm7RXgJGfAa6+Fx1YbLQAeZOWriQub4+2NFnD69
	YbISATGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbK7s-00EZfL-0Z; Mon, 04 Apr 2022 10:40:00 +0000
Received: from mx.msync.work ([2001:41d0:d:357f:aaaa::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbK7o-00EZcV-5D; Mon, 04 Apr 2022 10:39:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4965C3964D; Mon,  4 Apr 2022 10:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1649068790; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:
 disposition-notification-to; bh=K8y6f0ZyIOvwaXnDqPqMX/eCkxRTN6+lglp1GjSsoF0=; 
 b=WbQ5fDISwpYYjCwTRN06a2PF9QC4E6eLyo2UaFMa1S3Rz8yBnghyulWkLF9hlcaPXLyG6U
 jYEJAVSgXcUx7gh6m+zS0IN3Djz/fVBzj5JHvNY0FfhbP5iq8vj5nNNQK/zhZFYrenOjlj
 FdeUu70vEO3hGdGidGVvRRtvXl9M423wkhaDE8wFc5fKIMjonbdN7FHDvPt5GxyVN8Qr3h
 eQqJnj49aH06xMEfPrWieUC5oaN0G+QBMpnfFtO9k0dLlkQyDOnlvxe1ViSuCeT6FyeL27
 eZ6o1NUdebQJt5Jj0+dm7Sz4cV2DVzbjUlDuZKYbp9vpU5YWQ2YXfvd3L9Wpeg==
Subject: Re: [PATCH v2 0/4] arm64: meson: update dts for JetHub devices
To: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220326075110.1462301-1-adeep@lexina.in>
 <164905930207.1797085.9678466232916244683.b4-ty@baylibre.com>
From: Vyacheslav <adeep@lexina.in>
Message-ID: <d53b8c6f-6bc2-5445-c426-5409d324fac1@lexina.in>
Date: Mon, 4 Apr 2022 13:39:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <164905930207.1797085.9678466232916244683.b4-ty@baylibre.com>
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_033956_673147_48275094 
X-CRM114-Status: GOOD (  10.22  )
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

04.04.2022 11:01, Neil Armstrong wrote:
> Hi,
> 
> On Sat, 26 Mar 2022 10:51:06 +0300, Vyacheslav Bocharov wrote:
>> Update dts for JetHub H1:
>> - add bluetooth node for RTL8822CS uart port
>>
>> Update dts for JetHub D1:
>> - add ZigBee serial alias (ttyAML2) for backward compatibility
>> - update voltage regulators and SDIO config to match board's reference design
>> - update max freq for WiFi SDIO
>>
>> [...]
> 
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.19/dt64)

Thanks.

> 
> [1/4] arm64: meson: add dts bluetooth node for JetHub H1
>        https://git.kernel.org/amlogic/c/2bda08dfc501967a7a7bd6f77f04afef14dc7271
> [2/4] arm64: meson: dts: update serial alias in dts for JetHub D1
>        https://git.kernel.org/amlogic/c/cf94e26508ad411c2a618b00dfaae515affd0ca7
> [3/4] arm64: meson: update SDIO voltage in dts for JetHub D1
>        https://git.kernel.org/amlogic/c/81bbd2bd24a9ebac3871b293060df50445458c79
> [4/4] arm64: meson: update WiFi SDIO in dts for JetHub D1
>        https://git.kernel.org/amlogic/c/87a87657249316616138c103c2bdb7525c34d987
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
