Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7B4C3F2CD
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 15:57:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9192A217F4
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 15:57:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ReydEt86"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9192A217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPHbD1tsleZz4H+4H8RHVDSl9bRdx7K84fpg0ZFCdTo=; b=ReydEt86PGbZWw
	fNbml94ZuC2hvW2MCIpUKKz8zh0e6IxOw2b4pWIWWh31xHde6L//r8O9a67SgQNN+A3NAWlaun2vh
	y7uxftU3bM8eNUJvxH+qJ8bnqXH9rAx+YWvIVz4iepad9MnTF262+Mpj7f7FznLdh9/yaTvkvYQOs
	8OrUkYgnOCP0eAheN2pt8IKH/lO+fLxDqDS1V7A14UKFwuh7X9aeOgBx1OQfmUngBnT74fGuyr1MR
	em18lMbq9xkD7+pEx5DyErG//rS8pHzsWzhPtDgswT4CelHkkowD89nuSV7p7740DtS7ZC5j8KqKw
	yiq6EdoUHOFdTR9Go/Ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8nS0-0004mv-VJ; Mon, 02 Mar 2020 15:57:48 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8nRt-0004fJ-JQ; Mon, 02 Mar 2020 15:57:42 +0000
Received: from [10.18.91.152] (10.18.91.152) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 2 Mar
 2020 23:58:09 +0800
Subject: Re: [PATCH RESEND] dt-bindings: power: Fix dt_binding_check error
To: Kevin Hilman <khilman@baylibre.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, <linux-amlogic@lists.infradead.org>
References: <1582856099-105484-1-git-send-email-jianxin.pan@amlogic.com>
 <7h5zfpbbn8.fsf@baylibre.com>
From: Jianxin Pan <jianxin.pan@amlogic.com>
Message-ID: <caea291f-0059-ee84-6d75-ddcb1b393952@amlogic.com>
Date: Mon, 2 Mar 2020 23:58:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7h5zfpbbn8.fsf@baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.18.91.152]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_075741_635968_560E8120 
X-CRM114-Status: GOOD (  13.09  )
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Hi Kevin,


On 2020/3/1 0:28, Kevin Hilman wrote:
> Hi Jianxin,
> 
> Jianxin Pan <jianxin.pan@amlogic.com> writes:
> 
>> Missing ';' in the end of secure-monitor example node.
>>
>> Fixes: f50b4108ede1 ("dt-bindings: power: add Amlogic secure power domains bindings")
> 
> Thanks for the fix, but where did this commit ID come from?  I think
> this is the right upstream commit:
> 
> Fixes: 165b5fb294e8 ("dt-bindings: power: add Amlogic secure power domains bindings")
> 
> Also, when you resend, can you cc soc@kernel.org.  The soc maintainers
> are who queue my amlogic tree.  I will ack and they can submit to Linus
> for v5.7 so Stephen doesn't have to carry his local linux-next fix
> anymore.
> 
> Thanks,
The commit id is not correct, it from my local branch.
I corrected it and added soc maintainers to the cc list.
Thanks for your time. 
> 
> Kevin
> 
>> Reported-by: Rob Herring <robh+dt@kernel.org>
>> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
>>  Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
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
> 
> .
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
