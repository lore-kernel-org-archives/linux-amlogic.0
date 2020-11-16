Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FE7C4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 10:29:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 703EF221FD
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 10:29:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zkRPaoOK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.b="XnXqCm+Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 703EF221FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MarWonVVQ0n21SaxEOo26b7w3vgFH7EGHhHj6VQVyVI=; b=zkRPaoOKjra6Y8tTIrO7arl4CR
	Z/tAvvKexBWHs02ALnpnH+frkhkpOqFr2KBdPiJaOy3xJghvCLxciNyju66HP6iVMplCAUzB5tm8h
	P1L0OFh//ZtqjCMG1Le/HW/WgTZredcwOBysjIdaerRGOiU3MHZoSZPv5EAUmOoGl9o+sFKy8RWLA
	Yev2WkKQTn16C+r/aAKCqEhn7bNV0TN/BxOYWVOI3Duwqr8YnoO2xUi96ebljVZ3K8KmC6KZ38FYf
	IxWIgpB12wOGpNyyaztUYTBm9UXBZFs9qiYWhb7eZ4dr26apSEZnRJRIs3QQYAtcdEpAabeR3tFWb
	/Yzk1OcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kebl8-0003Ea-5J; Mon, 16 Nov 2020 10:29:18 +0000
Received: from de-smtp-delivery-52.mimecast.com ([62.140.7.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kebl5-0003Ds-M6
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 10:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1605522551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yDu6Ad+yb7tRsQcs9qMObDj6mPKODnR542vx7fuQEk0=;
 b=XnXqCm+ZBR9qq90AlXbHlGUsi3TnKL1GTAeyktQisQEtVlvKAgCXzzA0v4aPR8Ztt78vu3
 Uv46d1KL0vXIDlqi34FVFOJK6NjbTB8tS+Y5S28T+NHTYsbuFVPCxeAXDMYoGrqPFg/4kF
 OqqSdc+k/fQkSHkC2tOX5nw7FSjVcZo=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2--Cik0c9eOCqOMlwZEB0t8A-1;
 Mon, 16 Nov 2020 11:29:09 +0100
X-MC-Unique: -Cik0c9eOCqOMlwZEB0t8A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWxRqcp5s67f+piTVQw2v5tW//Nm4f/fspJtTEr5NnzZ/2MJ0HomWa8/NKc/2oyyvDU7jDyD8pvzv4LJOrIXthUfOkpW29Bk77IDkkunEXCp18ARgLiU+MGGYK9rwtRj5Ss8Wgkp0Fkv2Zow+8JodMMFHaBWoxUqpNqBPMy7mourNtBPaIH5iqnFXtksoteUOKi50eZaS9pmw6mzi/nx0weU05gxtlWf+fXerJ3WYsWFeBxPvlhUz1qM4jE5npsMOlOX84WpqEjpHRZIjaUoIVaOLQzag7NmkwWBpnXg0xhTq1rxYX3W0zG/sUWr5qhj2HHCiaJC6HPRpeQ1cH1oYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xv+mlTMWNInX+0nS4G8trH1UG441uG62/cTnogBt1+s=;
 b=mTdOPe6SSr+aF2uD+SfDZyZ4A0AMCLFTAy1nigfYJOzyZxC+IVZQ33+PVcUZk0nSOBuvRJLTOymXgsd51seb2PjdopksrI2YttiTcGlWRx6T4Ftdrdbl9zlmr9bNsVZY80IBpCWjcMPpgZ6VpCvuHk1qfK0qhz6374F9AZ5b82p61Dw2GICeIa/CnPJPM+Om4vNpN15dhJNUgYYoQ5xZ0TyAOwJ23eJXiFAYztBXvPr/b1G8q/6WtEvtccs7D61QopgRLmjwLKjLmImV5JqqNO+IOW0TSAHtUpfdGWlsRirdC3G99N0J6LB9LOq3Mad4mESbWQ2u3zQtg3wLeX6Vqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: khadas.com; dkim=none (message not signed)
 header.d=none;khadas.com; dmarc=none action=none header.from=suse.com;
Received: from PA4PR04MB7533.eurprd04.prod.outlook.com (2603:10a6:102:f1::19)
 by PA4PR04MB7696.eurprd04.prod.outlook.com (2603:10a6:102:f1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 10:29:07 +0000
Received: from PA4PR04MB7533.eurprd04.prod.outlook.com
 ([fe80::545:8a04:2a5c:f4c7]) by PA4PR04MB7533.eurprd04.prod.outlook.com
 ([fe80::545:8a04:2a5c:f4c7%6]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 10:29:07 +0000
Subject: Re: [PATCH RFC] arm64: dts: Use separate dtb for Khadas vim3 usb3 and
 pcie controller
To: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, gouwa@khadas.com, nick@khadas.com, art@khadas.com
References: <20201115033917.83302-1-wqu@suse.com>
 <25b4bbb5-07e8-4d82-a4cf-43f4d64c8983@baylibre.com>
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 mQENBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAG0GFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPokBTQQTAQgAOAIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJdnDWhAAoJEMI9kfOhJf6oZgoH
 90uqoGyUh5UWtiT9zjUcvlMTCpd/QSgwagDuY+tEdVPaKlcnTNAvZKWSit8VuocjrOFbTLwb
 vZ43n5f/l/1QtwMgQei/RMY2XhW+totimzlHVuxVaIDwkF+zc+pUI6lDPnULZHS3mWhbVr9N
 vZAAYVV7GesyyFpZiNm7GLvLmtEdYbc9OnIAOZb3eKfY3mWEs0eU0MxikcZSOYy3EWY3JES7
 J9pFgBrCn4hF83tPH2sphh1GUFii+AUGBMY/dC6VgMKbCugg+u/dTZEcBXxD17m+UcbucB/k
 F2oxqZBEQrb5SogdIq7Y9dZdlf1m3GRRJTX7eWefZw10HhFhs1mwx7kBDQRZ1YGvAQgAqlPr
 YeBLMv3PAZ75YhQIwH6c4SNcB++hQ9TCT5gIQNw51+SQzkXIGgmzxMIS49cZcE4KXk/kHw5h
 ieQeQZa60BWVRNXwoRI4ib8okgDuMkD5Kz1WEyO149+BZ7HD4/yK0VFJGuvDJR8T7RZwB69u
 VSLjkuNZZmCmDcDzS0c/SJOg5nkxt1iTtgUETb1wNKV6yR9XzRkrEW/qShChyrS9fNN8e9c0
 MQsC4fsyz9Ylx1TOY/IF/c6rqYoEEfwnpdlz0uOM1nA1vK+wdKtXluCa79MdfaeD/dt76Kp/
 o6CAKLLcjU1Iwnkq1HSrYfY3HZWpvV9g84gPwxwxX0uXquHxLwARAQABiQE8BBgBCAAmAhsM
 FiEELd9y5aWlW6idqkLhwj2R86El/qgFAl2cNa4FCQlqTn8ACgkQwj2R86El/qhXBAf/eXLP
 HDNTkHRPxoDnwhscIHJDHlsszke25AFltJQ1adoaYCbsQVv4Mn5rQZ1Gon54IMdxBN3r/B08
 rGVPatIfkycMCShr+rFHPKnExhQ7Wr555fq+sQ1GOwOhr1xLEqAhBMp28u9m8hnkqL36v+AF
 hjTwRtS+tRMZfoG6n72xAj984l56G9NPfs/SOKl6HR0mCDXwJGZAOdtyRmqddi53SXi5N4H1
 jWX1xFshp7nIkRm6hEpISEWr/KKLbAiKKbP0ql5tP5PinJeIBlDv4g/0+aGoGg4dELTnfEVk
 jMC8cJ/LiIaR/OEOF9S2nSeTQoBmusTz+aqkbogvvYGam6uDYw==
Message-ID: <46cb5cb0-bac4-5bd2-7adc-b350074b7ca7@suse.com>
Date: Mon, 16 Nov 2020 18:28:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <25b4bbb5-07e8-4d82-a4cf-43f4d64c8983@baylibre.com>
Content-Language: en-US
X-Originating-IP: [149.28.201.231]
X-ClientProxiedBy: SJ0PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::18) To PA4PR04MB7533.eurprd04.prod.outlook.com
 (2603:10a6:102:f1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [0.0.0.0] (149.28.201.231) by
 SJ0PR03CA0043.namprd03.prod.outlook.com (2603:10b6:a03:33e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 10:28:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edfee30d-8cfb-4018-3c82-08d88a1a72cd
X-MS-TrafficTypeDiagnostic: PA4PR04MB7696:
X-Microsoft-Antispam-PRVS: <PA4PR04MB76967EB6884BBF0EA7F008F8D6E30@PA4PR04MB7696.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DjuDn1m+gM9LWKe6yriss0JxjH5uYuOtTCmp90B4JpX3Qcu1CBmeOslKPpZhUu+t0eutKMMnMxpvzeosFSi5XYGipofSQsUXtCZ6ixw2kQKTqzlUV0SQQc69lObW3HUzCrx4nly7itGzDhMep2jZYGilDNWr1jsl3NIGUhD1JHyBCbwEECnZXb6Ab9B1iczO3lPSBYjiWKAdTNp2NAN+ETThVzEAX7A0WseKkgMAZrb3igN80n1kQc8B3c6WitMIcMDkpRNYStPEYV0fVP1f7YSZMTt06I0c4U9qB7vtikleA9XR6qkfOQzCNp6CqiltbWCcm2SizpaSWLhrWbFIRgytj+H5Y/NxURy68SRAGnRct8Rb+XSvDC6ql7rJjUaiRexluJugdECEvWsLB2+QxkolVd066+tx7xKNsTvlhdHNKXnV1+hB7lSRGsnGluBD1nq3mX6KjUj1kRyqQxJSfFc6JRd9OJiq6aHFBB7+REE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7533.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(136003)(396003)(346002)(376002)(5660300002)(66556008)(31686004)(36756003)(31696002)(956004)(6486002)(966005)(2616005)(478600001)(6706004)(8936002)(2906002)(6666004)(16526019)(66946007)(52116002)(53546011)(186003)(66476007)(26005)(86362001)(16576012)(316002)(8676002)(83380400001)(78286007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 5tFwJB6jbLNe+IwzNTnq8bDezLFlqpNxOZKqdzjfjSkLvnGp58I+fjHL5OoyWOrO/sW7xbaA/38uJBEZWkbufanpTZTM2ITzqPp9q8mpof5Tc1tEI6SQmrC19KPDmcvcensfoQFRo635r3j3RAimdPkynR973nkZ/i0K5dx5ifD0Zv7DyuLsRABto60oIRbx7FFXp+WoNIJu18RwYCEw97fenthnWvA/qPL6jDNVHCYjbQiBxo6hSmMPTDilT872V/WBY27u1Dsb7LVn/fgqhTBTwqC7hwhpLfK2RgZfjtb56Akum4/aQfUt4YSVHZmdNRHJWaIx1z/w9Xm+GeG8PeptqMQeb6/mQjL2pec+mrwvhgphcwVwd8g4mYBQC64A8aQL1pQpcrsh+XMtLnr0K816u2CJ8zCy38XCDtHQ58mZKUp+WkJRSPAqRzNQKZ+NcaHjdTaiwl6kMLnNJAyIKgwGqS6WhDJWR4pEtkTQbLVQ0S6kznkuHrg1EHmlb8C+YBVGlp/eimfVS86jpmAAs0m25o+pDb3/1m9BMLHG1tqA/rxEFfxRzx4ANe/cJwQKj8/sQ7R7CaUIWm9c4Fw7JXJ5lNaO6+fa70OM560eN0KbMlX+4T0SfWJ+ZCITYg0gYhlOffi47+1mY7wdwkJV35UoDFNb72eNfv2z1AmvpVdu38w3VIS7AFVXDn6e0Df4LebxmKeBfDXHGFqB/vFnjfxFizaIU6YvA5TezFIJUHb4K4ENHU9prIxtM0XcpknYeYKVoaOdoGBr5U465pvC/6PXwuobM2uZ+o9PjjdV8/Fd43dFwdCZlhBmNW+v9c9NHI7uoz6wXwodwoc7yZ4sOKvuDBvJ9jJGMvVfuZCEjxJJA8PVNeH3G8SkmW+9FELsPsNL2AQUtSTca/irahEk3Q==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edfee30d-8cfb-4018-3c82-08d88a1a72cd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7533.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 10:29:07.5220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTwW7XAzcq2LB9dOvjDcEhuZwfXXIFhVYEP1lbU6xqJs5X4pnf0Lu+fqYjjzdZJZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7696
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_052915_959575_A64CDDC9 
X-CRM114-Status: GOOD (  24.55  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIwLzExLzE2IOS4i+WNiDQ6MzMsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IEhpLAo+
IAo+IE9uIDE1LzExLzIwMjAgMDQ6MzksIFF1IFdlbnJ1byB3cm90ZToKPj4gQWx0aG91Z2ggdGhl
IHBsYW4gaXMgdG8gbWFrZSB0aGUgYm9vdGxvYWRlciAoVS1ib290KSB0byBsb2FkIG92ZXJsYXkg
Zm9yCj4+IHRoZSBkZXZpY2UsIGJ1dCBjdXJyZW50bHkgdGhlIGJvYXJkIGRvZXNuJ3QgaGF2ZSB0
aGUgdXBzdHJlYW0gc3VwcG9ydAo+PiB5ZXQuCj4gCj4gTm8gbmVlZCBmb3IgdGhhdCwgYXV0b21h
dGljIFBDSWUgZW5hYmxlIGlzIG5vdyBzdXBwb3J0IG9uIHVwc3RyZWFtIFUtQm9vdAo+IGZvciBW
SU0zICYgVklNM0w6Cj4gaHR0cHM6Ly9naXRodWIuY29tL3UtYm9vdC91LWJvb3QvY29tbWl0L2Fk
YmZmNjRhZjdiN2NlZTNlMDAwN2I3NWRmMjY0NDA5MGVkYWFmY2IKCkdyZWF0LgoKQlRXLCB0aGUg
dXBzdHJlYW0gVS1ib290IGlzIHN1cHBvc2VkIHRvIHJlcGxhY2UgdGhlIGZhY3RvcnkgVWJvb3QK
Y29tcGVsZXRlbHksIG9yIGp1c3QgdG8gYmUgY2hhaW5sb2FkZWQgZnJvbSBTRGNhcmQ/CgpUaGFu
a3MsClF1Cj4gCj4gTmVpbAo+IAo+Pgo+PiBUaGlzIG1lYW5zIGV2ZW4gdXBzdHJlYW0ga2VybmVs
IHN1cHBvcnRzIGFsbCB0aGUgbmVlZGVkIGRyaXZlcnMsIHdlIHN0aWxsCj4+IGNhbid0IGluaXRp
YWxpemUgdGhlIHBjaWUgY29udHJvbGxlci4KPj4KPj4gQXMgYSB3b3JrYXJvdW5kLCBtYWtlIHNl
cGVyYXRlIGRldmljZSB0cmVlcyBmb3IgcGNpZSBjb250cm9sbGVyIGFuZCB1c2IzCj4+IGNvbnRy
b2xsZXIuCj4+Cj4+IE5vdyB1c2VyIHN0aWxsIG5lZWQgdG8gZ28gaW50byB0aGUgZmFjdG9yeSBi
b290bG9hZGVyIHRvIHN3aXRjaCB0aGUgbXV4LAo+PiBidXQgdGhleSBjYW4gZWFzaWx5IGJvb3Qg
dGhlIGtlcm5lbCB3aXRoIFBDSUUgc3VwcG9ydCBieSBqdXN0IHN3aXRoY2luZwo+PiB0byB0aGUg
cGNpZSBkZXZpY2UgdHJlZS4KPj4KPj4gQW5kIHNpbmNlIHdlIGRpZG4ndCBtb2RpZnkgdGhlIG9y
aWdpbmFsIGR0YiwgdGhlIGZ1dHVyZSB1cHN0cmVhbSB1Ym9vdAo+PiBjYW4gc3RpbGwgdXNlIG92
ZXJsYXkgdG8gc3dpdGNoIG1vZGUgdXNpbmcgdGhlIHNhbWUgZHRiIGZpbGUuCj4+IFRoZSBhZGRl
ZCBuZXcgcGNpZSBkdGIgd2lsbCBqdXN0IGJlIGEgd29ya2Fyb3VuZC4KPj4KPj4gVGVzdGVkIG9u
IG15IFZJTTMgcHJvIGJvYXJkLCBub3cgSSBjYW4gYm9vdCB0aGUgcm9vdCBmcyBvbiB0aGUgTlZN
RQo+PiBkcml2ZSwgd2l0aCB1cHN0cmVhbSBrZXJuZWwgd2l0aCB0aGUgbmV3IHBjaWUgZHRiLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBRdSBXZW5ydW8gPHdxdUBzdXNlLmNvbT4KPj4gLS0tCj4+ICBh
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZpbGUgICAgICAgICAgfCAgMSArCj4+ICAu
Li4vbWVzb24tZzEyYi1hMzExZC1raGFkYXMtdmltMy1wY2llLmR0cyAgICAgfCAzOSArKysrKysr
KysrKysrKysrKysrCj4+ICAuLi4vYW1sb2dpYy9tZXNvbi1nMTJiLWEzMTFkLWtoYWRhcy12aW0z
LmR0cyAgfCAyMyArLS0tLS0tLS0tLQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25z
KCspLCAyMiBkZWxldGlvbnMoLSkKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi1hMzExZC1raGFkYXMtdmltMy1wY2llLmR0cwo+Pgo+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlIGIvYXJj
aC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlCj4+IGluZGV4IGNlZDAzOTQ2MzE0Zi4u
YTBiOGQzMDUzOWUyIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
TWFrZWZpbGUKPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlCj4+
IEBAIC02LDYgKzYsNyBAQCBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZzEyYS14
OTYtbWF4LmR0Ygo+PiAgZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWcxMmItZ3Rr
aW5nLmR0Ygo+PiAgZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWcxMmItZ3RraW5n
LXByby5kdGIKPj4gIGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBtZXNvbi1nMTJiLWEzMTFk
LWtoYWRhcy12aW0zLmR0Ygo+PiArZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWcx
MmItYTMxMWQta2hhZGFzLXZpbTMtcGNpZS5kdGIKPj4gIGR0Yi0kKENPTkZJR19BUkNIX01FU09O
KSArPSBtZXNvbi1nMTJiLXM5MjJ4LWtoYWRhcy12aW0zLmR0Ygo+PiAgZHRiLSQoQ09ORklHX0FS
Q0hfTUVTT04pICs9IG1lc29uLWcxMmItb2Ryb2lkLW4yLmR0Ygo+PiAgZHRiLSQoQ09ORklHX0FS
Q0hfTUVTT04pICs9IG1lc29uLWcxMmItb2Ryb2lkLW4yLXBsdXMuZHRiCj4+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi1hMzExZC1raGFkYXMtdmlt
My1wY2llLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLWEzMTFk
LWtoYWRhcy12aW0zLXBjaWUuZHRzCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAw
MDAwMDAwMDAwMC4uOTM2NDFhMzJlZWVjCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvYXJjaC9h
cm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItYTMxMWQta2hhZGFzLXZpbTMtcGNpZS5k
dHMKPj4gQEAgLTAsMCArMSwzOSBAQAo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wKyBPUiBNSVQpCj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChjKSAyMDE5IEJheUxpYnJl
LCBTQVMKPj4gKyAqIEF1dGhvcjogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tPgo+PiArICogQ29weXJpZ2h0IChjKSAyMDE5IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlh
bnNoZXdpdHRAZ21haWwuY29tPgo+PiArICovCj4+ICsKPj4gKy9kdHMtdjEvOwo+PiArCj4+ICsj
aW5jbHVkZSAibWVzb24tZzEyYi1hMzExZC5kdHNpIgo+PiArI2luY2x1ZGUgIm1lc29uLWtoYWRh
cy12aW0zLmR0c2kiCj4+ICsjaW5jbHVkZSAibWVzb24tZzEyYi1raGFkYXMtdmltMy5kdHNpIgo+
PiArCj4+ICsvIHsKPj4gKwljb21wYXRpYmxlID0gImtoYWRhcyx2aW0zIiwgImFtbG9naWMsYTMx
MWQiLCAiYW1sb2dpYyxnMTJiIjsKPj4gK307Cj4+ICsKPj4gKy8qCj4+ICsgKiBUaGUgVklNMyBv
bi1ib2FyZCAgTUNVIGNhbiBtdXggdGhlIFBDSWUvVVNCMy4wIHNoYXJlZCBkaWZmZXJlbnRpYWwK
Pj4gKyAqIGxpbmVzIHVzaW5nIGEgRlVTQjM0MFRNWCBVU0IgMy4xIFN1cGVyU3BlZWQgRGF0YSBT
d2l0Y2ggYmV0d2Vlbgo+PiArICogYW4gVVNCMy4wIFR5cGUgQSBjb25uZWN0b3IgYW5kIGEgTS4y
IEtleSBNIHNsb3QuCj4+ICsgKiBUaGUgUEhZIGRyaXZpbmcgdGhlc2UgZGlmZmVyZW50aWFsIGxp
bmVzIGlzIHNoYXJlZCBiZXR3ZWVuCj4+ICsgKiB0aGUgVVNCMy4wIGNvbnRyb2xsZXIgYW5kIHRo
ZSBQQ0llIENvbnRyb2xsZXIsIHRodXMgb25seQo+PiArICogYSBzaW5nbGUgY29udHJvbGxlciBj
YW4gdXNlIGl0Lgo+PiArICoKPj4gKyAqIFRoaXMgaXMgdGhlIFBDSUUgZGV2aWNlIHRyZWUuCj4+
ICsgKgo+PiArICogVW50aWwgdXBzdHJlYW0gdWJvb3QgY2FuIGJvb3QgdGhlIGJvYXJkIGFuZCBt
b2RpZnkgdGhlIG5vZGVzIGJlZm9yZSBib290aW5nCj4+ICsgKiBJdCdzIG11Y2ggZWFzaWVyIHRv
IGp1c3QgY2hvb3NlIHRoaXMgZGV2aWNlIHRyZWUgZmlsZSB0byB1c2UgUENJRSBjb250cm9sbGVy
Lgo+PiArICovCj4+ICsKPj4gKyZwY2llIHsKPj4gKwlzdGF0dXMgPSAib2theSI7Cj4+ICt9Owo+
PiArCj4+ICsmdXNiIHsKPj4gKwlwaHlzID0gPCZ1c2IyX3BoeTA+LCA8JnVzYjJfcGh5MT47Cj4+
ICsJcGh5LW5hbWVzID0gInVzYjItcGh5MCIsICJ1c2IyLXBoeTEiOwo+PiArfTsKPj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLWEzMTFkLWtoYWRh
cy12aW0zLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLWEzMTFk
LWtoYWRhcy12aW0zLmR0cwo+PiBpbmRleCAxMjRhODA5MDEwODQuLjljMTExZDc2YmFlYyAxMDA2
NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItYTMxMWQt
a2hhZGFzLXZpbTMuZHRzCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1nMTJiLWEzMTFkLWtoYWRhcy12aW0zLmR0cwo+PiBAQCAtMTYsMjYgKzE2LDUgQEAgLyB7Cj4+
ICB9Owo+PiAgCj4+ICAvKgo+PiAtICogVGhlIFZJTTMgb24tYm9hcmQgIE1DVSBjYW4gbXV4IHRo
ZSBQQ0llL1VTQjMuMCBzaGFyZWQgZGlmZmVyZW50aWFsCj4+IC0gKiBsaW5lcyB1c2luZyBhIEZV
U0IzNDBUTVggVVNCIDMuMSBTdXBlclNwZWVkIERhdGEgU3dpdGNoIGJldHdlZW4KPj4gLSAqIGFu
IFVTQjMuMCBUeXBlIEEgY29ubmVjdG9yIGFuZCBhIE0uMiBLZXkgTSBzbG90Lgo+PiAtICogVGhl
IFBIWSBkcml2aW5nIHRoZXNlIGRpZmZlcmVudGlhbCBsaW5lcyBpcyBzaGFyZWQgYmV0d2Vlbgo+
PiAtICogdGhlIFVTQjMuMCBjb250cm9sbGVyIGFuZCB0aGUgUENJZSBDb250cm9sbGVyLCB0aHVz
IG9ubHkKPj4gLSAqIGEgc2luZ2xlIGNvbnRyb2xsZXIgY2FuIHVzZSBpdC4KPj4gLSAqIElmIHRo
ZSBNQ1UgaXMgY29uZmlndXJlZCB0byBtdXggdGhlIFBDSWUvVVNCMy4wIGRpZmZlcmVudGlhbCBs
aW5lcwo+PiAtICogdG8gdGhlIE0uMiBLZXkgTSBzbG90LCB1bmNvbW1lbnQgdGhlIGZvbGxvd2lu
ZyBibG9jayB0byBkaXNhYmxlCj4+IC0gKiBVU0IzLjAgZnJvbSB0aGUgVVNCIENvbXBsZXggYW5k
IGVuYWJsZSB0aGUgUENJZSBjb250cm9sbGVyLgo+PiAtICogVGhlIEVuZCBVc2VyIGlzIG5vdCBl
eHBlY3RlZCB0byB1bmNvbW1lbnQgdGhlIGZvbGxvd2luZyBleGNlcHQgZm9yCj4+IC0gKiB0ZXN0
aW5nIHB1cnBvc2VzLCBidXQgaW5zdGVhZCByZWx5IG9uIHRoZSBmaXJtd2FyZS9ib290bG9hZGVy
IHRvCj4+IC0gKiB1cGRhdGUgdGhlc2Ugbm9kZXMgYWNjb3JkaW5nbHkgaWYgUENJZSBtb2RlIGlz
IHNlbGVjdGVkIGJ5IHRoZSBNQ1UuCj4+IC0gKi8KPj4gLS8qCj4+IC0mcGNpZSB7Cj4+IC0Jc3Rh
dHVzID0gIm9rYXkiOwo+PiAtfTsKPj4gLQo+PiAtJnVzYiB7Cj4+IC0JcGh5cyA9IDwmdXNiMl9w
aHkwPiwgPCZ1c2IyX3BoeTE+Owo+PiAtCXBoeS1uYW1lcyA9ICJ1c2IyLXBoeTAiLCAidXNiMi1w
aHkxIjsKPj4gLX07Cj4+ICsgKiBWaW0zIGRlZmF1bHQgdG8gVVNCMy4wIGluc3RlYWQgb2YgUENJ
RSBjb250cm9sbGVyLgo+PiAgICovCj4+Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
