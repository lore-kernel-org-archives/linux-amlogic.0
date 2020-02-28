Return-Path: <SRS0=AcXA=4Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDEFC3F2C6
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2020 02:20:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 013EA2469B
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2020 02:20:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KdXjq8ju"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 013EA2469B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KlOKYyKQ1TdlhbcDT8KS9A2qVsaQfR9JA9YGi9FsFYY=; b=KdXjq8jugQv8sx
	hP/0M4u4srTvJ9fAPAo9X1VDE6PaVQo84d0q9YBTVVfyLH1jT8tG4eVhVERu8t248ush343lqNd5m
	r1wsWTNOuZMNwsDfhxY100SZ8P+tVo4OhnmeMsVG/FRRTbdLU5tJyYZwYpkiWib8LL8+bg2sIEifo
	kDNFEhdDlVX2Tl3DbHzv8isJhqmeL4/gdYjQfMmNNnxGApjQYUp1bI1+lCbQvgR5a2kMnGr71P5vp
	twsdm7LUrxtHrvggQQUEmx2ocOrRnTvDEsnOmrhdF6qqQFdapvM3nVj50/WUH7fe02GZp6DVoA09D
	yLXc3IqVp0lwOWrU4tbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7VGR-0002RK-2v; Fri, 28 Feb 2020 02:20:31 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7VGH-0002If-ET; Fri, 28 Feb 2020 02:20:22 +0000
Received: from [10.18.91.106] (10.18.91.106) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 28 Feb
 2020 10:20:47 +0800
Subject: Re: [PATCH] dt-bindings: power: Fix dt_binding_check error
To: Rob Herring <robh@kernel.org>
References: <1582269169-17557-1-git-send-email-jianxin.pan@amlogic.com>
 <20200226172702.GA6632@bogus>
From: Jianxin Pan <jianxin.pan@amlogic.com>
Message-ID: <4f1d2562-31e1-0dfc-2c23-f208249848d6@amlogic.com>
Date: Fri, 28 Feb 2020 10:20:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200226172702.GA6632@bogus>
Content-Language: en-US
X-Originating-IP: [10.18.91.106]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_182021_486879_336FB95B 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: devicetree@vger.kernel.org, Victor Wan <victor.wan@amlogic.com>,
 linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Hi Rob,

Thanks for the ACK.
I have resent it to Kevin for linux-amlogic and Stephen for linux-next.

On 2020/2/27 1:27, Rob Herring wrote:
> On Fri, Feb 21, 2020 at 03:12:48PM +0800, Jianxin Pan wrote:
>> Missing ';' in the end of secure-monitor example node.
>>
>> Fixes: f50b4108ede1 ("dt-bindings: power: add Amlogic secure power domains bindings")
>> Reported-by: Rob Herring<robh+dt@kernel.org>
> 
> space                     ^
I fixed it in the resend version.
> 
>> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
>> ---
>>  Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> This error isn't in my tree, so make sure it's applied where the 
> referenced commit is.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 
>>
>> diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>> index af32209..bc4e037 100644
>> --- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>> +++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>> @@ -36,5 +36,5 @@ examples:
>>              compatible = "amlogic,meson-a1-pwrc";
>>              #power-domain-cells = <1>;
>>          };
>> -    }
>> +    };
>>  
>> -- 
>> 2.7.4
>>
> 
> .
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
