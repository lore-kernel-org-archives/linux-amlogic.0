Return-Path: <SRS0=Cl/A=XE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872BBC4740A
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 16:12:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AB652082C
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 16:12:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FlgRqApV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AB652082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZHfwiy+7tOlFZDnHCNILVp8eIetUvDpt+pG/vAXlM6g=; b=FlgRqApVP+OOa+
	pJUfSQJRYHpDGPe5kgMmeSYI+ccgQ07z3K2FavC91CCLk8sZijoJNnaM0h2vzdtXUrewa33DuDPDH
	xLDIYypyewt/G91g1BH1fMJSSsu75YyFkuKV/075O78E903ZjBvaHMt+qRP1InfAYxzy3WAf2KDNA
	08KQJKsr5OJX5dDoDcrNqr3cYIViwuUV2Tp0QzayL31taaKpwAXyMpjN4HSB3nksWrw5PVXOtH6qi
	0KadzxRXMhx6aoslAQfOR/Qv2n+dKi1I9yJOkNGO7hdspB9ERcsxUsyJS6Fin//bFWw41FpSqn39E
	U1XQFgSerVo0TP3bdQCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7MGn-0004Fg-Eq; Mon, 09 Sep 2019 16:12:01 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7MGd-00047Y-DC; Mon, 09 Sep 2019 16:11:52 +0000
Received: from [192.168.0.108] (223.167.21.35) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 10 Sep
 2019 00:12:33 +0800
Subject: Re: [PATCH v2 4/4] arm64: dts: add support for A1 based Amlogic AD401
To: Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>
References: <1567667251-33466-1-git-send-email-jianxin.pan@amlogic.com>
 <1567667251-33466-5-git-send-email-jianxin.pan@amlogic.com>
 <CAFBinCBSmW4y-Dz7EkJMV8HOU4k6Z0G-K6T77XnVrHyubaSsdg@mail.gmail.com>
 <be032a85-b60d-f7f0-8404-b27784d809df@amlogic.com>
 <CAFBinCD7gFzOsmZCB8T1KJKVsgL7WMhoEkj3dRzyqwAnjC0CNA@mail.gmail.com>
 <1jv9u1ya3o.fsf@starbuckisacylon.baylibre.com>
From: Jianxin Pan <jianxin.pan@amlogic.com>
Message-ID: <b8350c34-1fcc-76b8-6722-1e3309089c04@amlogic.com>
Date: Tue, 10 Sep 2019 00:12:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1jv9u1ya3o.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-Originating-IP: [223.167.21.35]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190909_091151_447405_63313B6C 
X-CRM114-Status: GOOD (  11.60  )
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
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Tao Zeng <tao.zeng@amlogic.com>,
 Qiufang Dai <qiufang.dai@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On 2019/9/9 19:36, Jerome Brunet wrote:
> 
> On Sat 07 Sep 2019 at 17:02, Martin Blumenstingl wrote:
> 
>> Hi Jianxin,
>>
>> On Fri, Sep 6, 2019 at 7:58 AM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
>> [...]
>>>> also I'm a bit surprised to see no busses (like aobus, cbus, periphs, ...) here
>>>> aren't there any busses defined in the A1 SoC implementation or are
>>>> were you planning to add them later?
>>> Unlike previous series,there is no Cortex-M3 AO CPU in A1, and there is no AO/EE power domain.
>>> Most of the registers are on the apb_32b bus.  aobus, cbus and periphs are not used in A1.
>> OK, thank you for the explanation
>> since you're going to re-send the patch anyways: can you please
>> include the apb_32b bus?
> 
> unless there is an 64 bits apb bus as well, I suppose 'apb' would be enough ?
>
There is no 64bits apb bus in A1, only apb32. 
Unlike the previous series, For A1 and C1, we can not get bus information for each register from the memmap and datesheet.
Do we need to add bus description for them too? If yes, I can add 'apb' .  
>> all other upstream Amlogic .dts are using the bus definitions, so that
>> will make A1 consistent with the other SoCs
>>
>>
>> Martin
> 
> .
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
