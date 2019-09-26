Return-Path: <SRS0=DMeG=XV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56906C432C2
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 03:41:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CDBC207E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 03:41:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p0Hc/n3G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CDBC207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v58x0Qz4S9e52eKTOrtGyVV+bOjMEzMNKB+FatLSc/4=; b=p0Hc/n3GP28J82jsExfR4GB3+
	krh34mREIEYtEo7EmtgRPNVNIK+FjR3U4vV3CtL49FtzOlpTUK14duk8KEp3KNqYVyqlQ6blCvqm+
	zRoujRtBtrlu257d8QoEMTYtEzZST3eX+ziqp7vIMo+sAVtJIrbAH7bXQWP5u0hXQZ6E8FWDfr/hF
	Rmtaw4SSmijrrFcg8iaEM7fI2k4It50ZKeZCz1RXANBBCnJhnHYhlATgRh8jgrGlFtZO0snXbTYya
	N7jkoEbR1qvlbl8UeJHSBc8kRWPIz0IGCmkSZs6aObhyS7FpB1VYI/+eUDVU8g99yq69KE7+jocJQ
	k08U6aomw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDKeP-0001D1-QB; Thu, 26 Sep 2019 03:41:05 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDKe9-00010K-R5; Thu, 26 Sep 2019 03:40:51 +0000
Received: from [10.28.19.63] (10.28.19.63) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 26 Sep
 2019 11:40:36 +0800
Subject: Re: [PATCH v2 2/3] dt-bindings: reset: add bindings for the Meson-A1
 SoC Reset Controller
To: Kevin Hilman <khilman@baylibre.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Neil Armstrong <narmstrong@baylibre.com>
References: <1569227661-4261-1-git-send-email-xingyu.chen@amlogic.com>
 <1569227661-4261-3-git-send-email-xingyu.chen@amlogic.com>
 <7htv90rnp2.fsf@baylibre.com>
From: Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <5d2af18b-1b0a-0b35-9855-b27bbae3a71b@amlogic.com>
Date: Thu, 26 Sep 2019 11:40:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7htv90rnp2.fsf@baylibre.com>
Content-Language: en-GB
X-Originating-IP: [10.28.19.63]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190925_204049_881300_952D4D2E 
X-CRM114-Status: GOOD (  14.00  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi, Kevin
Thanks for your review

On 2019/9/26 6:55, Kevin Hilman wrote:
> Xingyu Chen <xingyu.chen@amlogic.com> writes:
> 
>> Add DT bindings for the Meson-A1 SoC Reset Controller include file,
>> and also slightly update documentation.
>>
>> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
>> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> 
> The order here doesn't look right.  As the sender, your sign-off should
> be last.  Is Jianxin the author or are you?  If Jianxin, there should be
> a "From:" line at the beginning of the changelog to indicate authorship
> that's different from the sender.
I am an author for this patchset, i will reorder Signed-off in next version.
> 
>> ---
>>   .../bindings/reset/amlogic,meson-reset.yaml        |  1 +
>>   include/dt-bindings/reset/amlogic,meson-a1-reset.h | 59 ++++++++++++++++++++++
>>   2 files changed, 60 insertions(+)
>>   create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-reset.h
>>
>> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
>> index 00917d8..b3f57d8 100644
>> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
>> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
>> @@ -16,6 +16,7 @@ properties:
>>         - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
>>         - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
>>         - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
>> +      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
>>   
>>     reg:
>>       maxItems: 1
>> diff --git a/include/dt-bindings/reset/amlogic,meson-a1-reset.h b/include/dt-bindings/reset/amlogic,meson-a1-reset.h
>> new file mode 100644
>> index 00000000..8d76a47
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/amlogic,meson-a1-reset.h
>> @@ -0,0 +1,59 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> + *
>> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
>> + * Author: Xingyu Chen <xingyu.chen@amlogic.com>
>> + *
>> + */
>> +
>> +#ifndef _DT_BINDINGS_AMLOGIC_MESON_A1_RESET_H
>> +#define _DT_BINDINGS_AMLOGIC_MESON_A1_RESET_H
>> +
>> +/* RESET0 */
>> +#define RESET_AM2AXI_VAD		1
> 
> minor nit: can you use comments/whitespace here to indicate holes?
> Please see the other amlogic files in this dir for examples.
I will fix it in next version.
> 
> Kevin
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
