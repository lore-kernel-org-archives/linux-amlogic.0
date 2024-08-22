Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38844C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2024 03:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9LlMLi0AjfFwal04IC0gZL4uMyOyEenQQDM7VOPTEQ=; b=ENSBcddhbrrB9P
	MhCAhIbmGFFhOOHb8rH8vJoGcV0jMjbdXLUrSm73ZRCB13eaW2aOjBMlpcVBAvHuzgzig1hr0+FKN
	GHRaieOcDyNUZjN/+h9zqHrA6Kx7jgK1Y7W5IZOrGbqQcUIvUPzlliH8+ux74R0bRSJHbya/S74h4
	h9+IcdBgk92n2cxWjI6QFSeqZ3+VLQmI1OJ1k1uzvJel8QpXaq+dj9v4t2YqFWeK6XaUBHbmxYsE5
	Ty+e7DXhapPcy+6rDPkKwCXSMjruxrYZpjCcUe/5O/8IsIG+OufvgrXp9MBzqL0VERff9WwHgMS4k
	brpPO5+RsiLd9PiLkIZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgyFt-0000000BAsc-3BJ0;
	Thu, 22 Aug 2024 03:12:57 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgyFm-0000000BArL-3NkG
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Aug 2024 03:12:55 +0000
X-QQ-mid: bizesmtp80t1724296322tfvcpfc8
X-QQ-Originating-IP: jqY3a0bkQxjN7ZKmsWfjBWICqB/Nx/uhe2vrpngJqOQ=
Received: from [192.168.159.131] ( [106.150.157.243])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 22 Aug 2024 11:11:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12622779271378069111
Message-ID: <0D8F14444C69EB08+cfb9ef39-4243-4dd6-859f-98ca34e00e98@radxa.com>
Date: Thu, 22 Aug 2024 12:11:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: amlogic: add support for Radxa
 ZERO 2 Pro
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20240712215111.687478-1-naoki@radxa.com>
 <172416784208.3050902.355272849812987526.b4-ty@linaro.org>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <172416784208.3050902.355272849812987526.b4-ty@linaro.org>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_201251_344117_C60E9355 
X-CRM114-Status: GOOD (  12.28  )
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

Hi,

I'm sorry, could you drop these patches from amlogic/linux.git?

I changed my mind that adding new dts just for renaming product is wrong.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

On 8/21/24 00:30, Neil Armstrong wrote:
> Hi,
> 
> On Sat, 13 Jul 2024 06:51:10 +0900, FUKAUMI Naoki wrote:
>> Radxa ZERO 2 Pro is a ultra tiny high performance SBC[1] using the
>> Amlogic A311D chip.
>>
>> [1] https://radxa.com/products/zeros/zero2pro
>>
>>
> 
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.12/arm64-dt)
> 
> [1/2] dt-bindings: arm: amlogic: add support for Radxa ZERO 2 Pro
>        https://git.kernel.org/amlogic/c/8f97ee0c9f5c6fc250847d7492875a6d7152ba68
> [2/2] arm64: dts: amlogic: add support for Radxa ZERO 2 Pro
>        https://git.kernel.org/amlogic/c/69591796c5d585816a306134f6d565cf19da575e
> 
> These changes has been applied on the intermediate git tree [1].
> 
> The v6.12/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
> for inclusion in their intermediate git branches in order to be sent to Linus during
> the next merge window, or sooner if it's a set of fixes.
> 
> In the cases of fixes, those will be merged in the current release candidate
> kernel and as soon they appear on the Linux master branch they will be
> backported to the previous Stable and Long-Stable kernels [2].
> 
> The intermediate git branches are merged daily in the linux-next tree [3],
> people are encouraged testing these pre-release kernels and report issues on the
> relevant mailing-lists.
> 
> If problems are discovered on those changes, please submit a signed-off-by revert
> patch followed by a corrective changeset.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
