Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72163C433E6
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 09:39:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E4BE2075B
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 09:39:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xlyb5FHK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="GBX+IFTz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E4BE2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wFcFlaqNUXpYEQrlwCGGHKrEAvf1+1hrYwgawkAY2A4=; b=Xlyb5FHKNjIFHMkgPV0t6X07X
	hxaE1UEzTjdvW1OPphDwzzbh/gjY0mrVTN9kfktmbuRzQyV3eT7/C29YBPBFqSx3UB17szJWn4qGT
	23KHSEcFbGQJuNyJ0sd4/UW8g1KSNSzzbHBUjAXhXnHGo/9sJxhAjR3LgZfspyNbJ7voXhEIKxZEq
	EXBNFe9f5kTI2NQgdlOYm4dBLCEzoPX3JSganuGMgv1veP4RGMMtZdhv4l8sVU2GDunsEmj/WLclk
	Kfi38t/kcVLDqgNbyxiLEyk1yMFeHwq+rC1Qef+ymnM/LLGT6+xogjGgLdgNtE5SJgwqLAyhLofbi
	l8p0Ji0Yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBaqw-0006el-DY; Fri, 28 Aug 2020 09:39:22 +0000
Received: from mail-eopbgr10100.outbound.protection.outlook.com
 ([40.107.1.100] helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBaqr-0006cJ-CL; Fri, 28 Aug 2020 09:39:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckU0kA8bUDg25cavNqpstsPFCKvm938xSPUbaoq79ySV9C6Vh/sKOfe5MEmfUkFlgPdqPDn9YfgfbIM71CahF6Lur6rq6ldzxJ0LM+OTPWL6E1qHxYfDseaWGnxq2IBk8cqNPV11ajqF9HDTdIGIIsjMKuHFb4/2UDU3SCn/mrAAJcHRcQc0JMFurAtSbohF8FdxhdsSo8/5CK9DGSwSQgwZEGx5oob9BThLe6wIVQ4xpbD03PHxq3KpZWhQVMPuopAdPlnuGhS4M7woiUDky65RuCD81i9dAMMueyfEjsNUF5ygeLHJJPUDOCom/eKWJeXxiPUFr4KTAG7SMxqYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EER4D2xVJD6DObDGorq4b4FhD/JtHZlKesJ19VEQNzQ=;
 b=eEjWFiUiKADZIHXduQY6evxoK+Ty/JjZLn8hz0vvTk2k99uaTpncOleMiLAH6dg/woqyzHAypz5xO9a3MXhQGBUxgH2y+GzdnHqIiHMvzGWryuMzi8mQffmkUl9cJ613Vg2xY6FspFvgIrbnyQu22u5RoxhLDx6nYle6uCvluGRzcWj9n8i0PK51gIhAnQYuSPj5CTgWaoyVxzrBW3qu0AFIEL7IyPyQgynzmvte9ws8ABr+qz6ZrjV1W0chKCbagVyAx9T3Qmf0l809CiFwYIMkjBknJgGzhFus+KSmW5l3W3LUNs8l+eaFrHBJPapvNbFkj/dMasUefIIVoQnfOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EER4D2xVJD6DObDGorq4b4FhD/JtHZlKesJ19VEQNzQ=;
 b=GBX+IFTzIi6hk9LR/Pas/SDdHImdNm95dpMf+fUtqQs6zPmt0O7XmpNTlPhuFDk0wAf0m9KkIk85A+Ww72xBf2CNhPOFRbLKn6nEw9HQVsqwChfhd63JerULlZ+Vt6PxmZfnFwvFyWEaHStzUzytk6vxp+3Y3xZ4SsX+H3+pb7U=
Authentication-Results: st-md-mailman.stormreply.com; dkim=none (message not
 signed) header.d=none;st-md-mailman.stormreply.com; dmarc=none action=none
 header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5963.eurprd02.prod.outlook.com (2603:10a6:10:fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Fri, 28 Aug
 2020 09:39:12 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::3890:7b1:97a6:1e47]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::3890:7b1:97a6:1e47%7]) with mapi id 15.20.3326.021; Fri, 28 Aug 2020
 09:39:12 +0000
Subject: Re: [PATCH v2 09/18] iio: afe: iio-rescale: Simplify with
 dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-9-krzk@kernel.org>
 <f4a5777e-fe85-9f3f-4818-f7539f223adc@axentia.se>
 <20200828062443.GA17343@pi3>
 <3a5cb59b-454e-2c3f-9f31-43147e843c66@axentia.se>
 <CAJKOXPcqNE5U82UThzBTPCvucCf2LsCVSfAHE1vnecJGCKCaig@mail.gmail.com>
From: Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <b7a5a441-cda1-ad02-b723-255231f2bd94@axentia.se>
Date: Fri, 28 Aug 2020 11:39:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <CAJKOXPcqNE5U82UThzBTPCvucCf2LsCVSfAHE1vnecJGCKCaig@mail.gmail.com>
Content-Language: sv-SE
X-ClientProxiedBy: HE1PR0402CA0001.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::11) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.226.217.78) by
 HE1PR0402CA0001.eurprd04.prod.outlook.com (2603:10a6:3:d0::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 09:39:09 +0000
X-Originating-IP: [85.226.217.78]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ed3dfb1-6a22-4589-f0dc-08d84b363831
X-MS-TrafficTypeDiagnostic: DB8PR02MB5963:
X-Microsoft-Antispam-PRVS: <DB8PR02MB5963383356CD6038E2B0F274BC520@DB8PR02MB5963.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XTd8DqynySNqAAJtw9purTjVqgkJCArFCtgGBUXJPWMk4oUMl22DbfgaMdz5y6tHRu+Z34Y9mg+lHQ+G3+AZJnB+RJxDMLH0QKV5c2Vy8zQpbi+ZIbd10rvAZoW11x7uYq7a9Wgu6iUVPQ16N6+K+XW8G7eedtSgJMpHFkH+h6Ms2Y8SnQ3vGtbsZOitZjWCf9yehqxtbj2fUHwLsWYXDdYLvS2WlmBrjGmiiQYx2AXhS9uIYlTiWE2uTq1hV/N1Y64sznyM3wNti/nkNfW6jjit2n05p/1zI6HGenOPH8UEtJ7bLkLPwLpYDn94/OdEjd/ptmMzQLHxnzKjb6qHhrv1DuaSHs7kURHPfcashNbGDVbI0petAlQePLhtyaGc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5482.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(396003)(39830400003)(376002)(366004)(186003)(53546011)(26005)(86362001)(66946007)(36756003)(16526019)(36916002)(66476007)(52116002)(54906003)(8936002)(31686004)(6486002)(2906002)(7416002)(316002)(66556008)(83380400001)(5660300002)(8676002)(956004)(478600001)(31696002)(6666004)(2616005)(6916009)(16576012)(4326008)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: fFuW0aTocJSI0TX8mop6Rz+LPrSFQwV5pft/ycIR+awA/qrXD84qSDfE1oMfWvKH9x8ittxiOCH3vH2+Jh1zJfq5WrhEmwPu7AyW/nYk5rfhmbbphRa1V7U6Zkh9M4RvkTiiDIP+oNc4M+10BVos9aTUOQc3AstG1iz3tpBpJn9isperibXmQXJzM1/6VggYiyiBeuUbAewQLC+/jsZC66lSgbYqSwdElVqXucMFW8oF/B3xpd3pjEsrxx5dspgjXEeFAgeHEjXcWm+4bv1f/bpYAMTLJGigDhbLpcSk6UoD8JhbMOBoHXBzyzSzYYKEL7MtbuFY2EENuKud7d4ewopZQ11+JKGUbLwfBKiPjvcMn5sGNtNI6oTxCWnQc5fppRuahJOSQiHE62TtcV3ak3q3NlBv66elMk5jEz6lz4zirGutOr2463VRIo1QqNiuF2zA6+AHEgnuiRHZOVc/C95eEiAlr9VC9B/q9V3fyCkpqUG2hna0kYPkC/1CKgM/ZP7nnCcRI3EDRP0KpvWGofPkZUHCQeM526d1pxl0Tg42jIWt2q8Vh535akpsAFnUgKyMruliC3k+cqRtP91TaR4a9ENrrL/ekxnloRlJGmzKXV2kOpF84YyE0zsoEBhzq8UQcmyBcBK+hnrJ0gOz3A==
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed3dfb1-6a22-4589-f0dc-08d84b363831
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 09:39:11.9207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXh13lGNev0aiotYE+QTZLXyzYRvdCwLAtJqH/a/ess20cFCKz3nyHzYhEQXS3GM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5963
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_053917_677938_1716ACD3 
X-CRM114-Status: GOOD (  20.95  )
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
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2020-08-28 09:03, Krzysztof Kozlowski wrote:
> On Fri, 28 Aug 2020 at 08:58, Peter Rosin <peda@axentia.se> wrote:
>>>> I'm not a huge fan of adding *one* odd line breaking the 80 column
>>>> recommendation to any file. I like to be able to fit multiple
>>>> windows side by side in a meaningful way. Also, I don't like having
>>>> a shitload of emptiness on my screen, which is what happens when some
>>>> lines are longer and you want to see it all. I strongly believe that
>>>> the 80 column rule/recommendation is still as valid as it ever was.
>>>> It's just hard to read longish lines; there's a reason newspapers
>>>> columns are quite narrow...
>>>>
>>>> Same comment for the envelope-detector (3/18).
>>>>
>>>> You will probably never look at these files again, but *I* might have
>>>> to revisit them for one reason or another, and these long lines will
>>>> annoy me when that happens.
>>>
>>> Initially I posted it with 80-characters wrap. Then I received a comment
>>> - better to stick to the new 100, as checkpatch accepts it.
>>>
>>> Now you write, better to go back to 80.
>>>
>>> Maybe then someone else will write to me, better to go to 100.
>>>
>>> And another person will reply, no, coding style still mentions 80, so
>>> keep it at 80.
>>>
>>> Sure guys, please first decide which one you prefer, then I will wrap it
>>> accordingly. :)
>>>
>>> Otherwise I will just jump from one to another depending on one person's
>>> personal preference.
>>>
>>> If there is no consensus among discussing people, I find this 100 line
>>> more readable, already got review, checkpatch accepts it so if subsystem
>>> maintainer likes it, I prefer to leave it like this.
>>
>> I'm not impressed by that argument. For the files I have mentioned, it
>> does not matter very much to me if you and some random person think that
>> 100 columns might *slightly* improve readability.
>>
>> Quoting coding-style
>>
>>   Statements longer than 80 columns should be broken into sensible chunks,
>>   unless exceeding 80 columns significantly increases readability and does
>>   not hide information.
>>
>> Notice that word? *significantly*
> 
> Notice also checkpatch change...

How is that relevant? checkpatch has *never* had the final say and its
heuristics can never be perfect. Meanwhile, coding style is talking about
exactly the case under discussion, and agrees with me perfectly.

> First of all, I don't have a preference over wrapping here. As I said,
> I sent v1 with 80 and got a response to change it to 100. You want me
> basically to bounce from A to B to A to B.
> 
>> Why do I even have to speak up about this? WTF?
> 
> Because we all share here our ideas...
> 
>> For the patches that touch files that I originally wrote [1], my
>> preference should be clear by now.
> 
> I understood your preference. There is nothing unclear here. Other
> person had different preference. I told you my arguments that it is
> not reasonable to jump A->B->A->B just because each person has a
> different view. At the end it's the subsystem maintainer's decision as
> he wants to keep his subsystem clean.

Yeah, I bet he is thrilled about it.

Cheers,
Peter

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
