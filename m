Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA86C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jan 2022 07:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TeUimv4BN/acR+Y0pXRulc8faGQQzSsR/Sp3PeIKvwU=; b=SDwMmZgljfw9As
	aehWlYoUPkxVo2dMqmKYRmV7hiQVvEO4Ki1+kKX3Gnp5ZFnmLjppthwRmf667YiRNp7MPclgFLK5u
	9ncYbqP3PKdnzoQ/4e3PFGZUSb/kDFowSH0bbmvsPKbzhGzd5B7KjbnIN567DxsitsEbxBYkrmGDz
	Xy8OKrPM2mapk1z0cV3agbkfAwsm0sETSI3lGe8TF47ACWcHfCEYaRmx3yQ8PFEuvna2hl4cYNtJ6
	QjGo/O1ZGb/rEw3Ofotnl/oW2nbmsXxpmogm/Obl4qjcj4a84bRFePdpwg4LZp0bRCm33lTTRn3Me
	BN8EomnGbZvk/QfWnL+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7BQK-00F43w-9h; Tue, 11 Jan 2022 07:18:28 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7BQ8-00F412-PK; Tue, 11 Jan 2022 07:18:17 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 11 Jan
 2022 15:18:14 +0800
Message-ID: <fbca8027-f7f0-7822-5252-0be586a66496@amlogic.com>
Date: Tue, 11 Jan 2022 15:18:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V5 1/5] dt-bindings: serial: meson: Drop legacy compatible.
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
CC: "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "open
 list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20220110104214.25321-1-yu.tu@amlogic.com>
 <20220110104214.25321-2-yu.tu@amlogic.com>
 <CAL_JsqKFLnfc5eaUHeo6EkbS0kkpA94rh=Zuda9V9aCragdVxw@mail.gmail.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <CAL_JsqKFLnfc5eaUHeo6EkbS0kkpA94rh=Zuda9V9aCragdVxw@mail.gmail.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_231816_862448_C8BFBDE1 
X-CRM114-Status: GOOD (  12.21  )
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

Hi Rob,
	Thank you very much for your reply.

On 2022/1/11 0:18, Rob Herring wrote:
> [ EXTERNAL EMAIL ]
> 
> On Mon, Jan 10, 2022 at 4:42 AM Yu Tu <yu.tu@amlogic.com> wrote:
>>
>> Deprecated, don't use anymore because legacy amlogic,meson-gx-uart
>> compatible. Don't differentiate between GXBB, GXL and G12A which
>> have different revisions of the UART IP. So it's split into
>> GXBB,GXL and G12A.
> 
> You are breaking compatibility. If your dts is updated to use the new
> compatible, then a kernel without the change will not work anymore. It
> worked before without understanding the changes you are making. It
> should continue to. A compatible value like this would accomplish what
> you want:
> 
> "amlogic,meson-gxbb-uart", "amlogic,meson-gx-uart", "amlogic,meson-ao-uart"
> 
> A new kernel will match on "amlogic,meson-gxbb-uart" or
> "amlogic,meson-gx-uart" depending if the dtb is updated or not. An old
> kernel will continue to match on "amlogic,meson-gx-uart".
> 
> If you are going to go breaking things, the power domain distinction
> in the compatible is odd...
> 
I will not blindly delete this "amlogic, meson-gx-uart" compatible as 
you suggest, just make a comment until all DTS changes are finished.
> 
> Rob
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
