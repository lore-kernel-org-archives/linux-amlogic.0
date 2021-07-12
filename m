Return-Path: <SRS0=/T27=ME=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0394AC07E9C
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jul 2021 06:42:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3A5561156
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jul 2021 06:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3A5561156
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2CMEcokbnmAsev8MHTB4SCXv3TbTZGfZ22Uthv+qYXA=; b=1aTsThr+44Bn/W
	lml26cdSm0ijHu5z6HOnWHqogwfdxl+zTVUwSR8/62Qa9AJcncrScpimTOaEFRJK0RIVyTp18aRWf
	o4XJIGRmpQTMUCDVB4lOVB06rCk0U9kuAhKpjxqStjAW38WYUeCs2ZemcaQPg/GwTsI76zj99FisR
	yQs9LQ3NFWUJBHfiqyUVFZFV5Z/By6q9rj0RtxNEdhxHHBVkSGzvJk7pfJDCl76t+CSlrYxbBuaWr
	zZrOcV5vl+6/qRuAw31t60Fe6+eNr+0kRrxT6J0rwVBy2JRLPmhpSMjxqxiPH4OTmpDwzuRHju1uC
	zsMJ9jMELMqU1xvkBCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2peB-0068zX-B2; Mon, 12 Jul 2021 06:42:31 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2pe8-0068xf-8D
 for linux-amlogic@lists.infradead.org; Mon, 12 Jul 2021 06:42:29 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8005BC0519;
 Mon, 12 Jul 2021 06:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1626072146; bh=N7wC+DmBmm8EW3+WSv/SWzpwmHo703ERTp50QZrgEwc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=H3L9a9zvpUdxWCxp2o+o3w6gYe2O4N68HGYmdO0eMCNrLEK0VT+jcupZGJfbb9DYx
 9+3VAAtTy5fniIcimk+hxvVNH+VEARIb5p7PnVKX+jUqbDZC+tRKLBBwxX8RAdo1QJ
 OamBzMRMJ0d7x2rxrKe9xM+Ij+B/wOmtzbFdZl0SqvloWD7FgOdJs+6mHEarQeTnbM
 mqVAjzvAoZit0E9i07ErHNttBDcsPykp7PIeSeq4WA+SUPJRq91qKlYkjQ7M85ImmY
 C7ENM0u1AiLT+Bfc23rxAz60Gji6ztkhXKu7R/btIwZch0goTH8v5fpbbIQYTKiHX8
 orsMTmcYdOVJg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 00255A0085;
 Mon, 12 Jul 2021 06:42:22 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 78EE240099;
 Mon, 12 Jul 2021 06:42:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Ev2AxWEZ";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/McBwouMUPHqQTkZ60bPMx1U31RqEiuNPeEz50HsptPNo+jTKHODz4b12R34ovxNztDFIJhL45v4Ba2UNuRzk41vl3OeUZNCrAUGJtmEM/rmoQ8RUSAlDEwHrFM1Bz54+Qr6d/UVuu8bcUIVWKLRpk2vDx0zu9wSX/J7lLAHYzc8B/37LuNTpGvmoZk5rQS1CW79HiKBS4ESWqtI9A+OsHDQUvOA22UuALzXU9db/GYm9uHQu0vNlIHPLeLWDG3oUzH5Y7hPlEcxnwDNPNJPC48jPVXe827D9P6DMVfopZbKnC3cnLgWrE/3hA9H/ZR+shK7S5dTXB6Xnjkr67vuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7wC+DmBmm8EW3+WSv/SWzpwmHo703ERTp50QZrgEwc=;
 b=MhL+XAutHeNf2Eg2+Wh6+ZBuavS6y2C7ISwYofKscu6vrkVB4odWwt/RMTcx9C7rXxMBE3R8gWoSXjK6UlBNoPIrHGI1eijCkssTQlgDrj05N8Nvrd00FBhfnS8zIrCxxcQNX0WgKnDWZ+83TDRbrAX1GpoguDVRxnFFsRbyy2bEWON6LorddnvY/oLJPeA4g/prAnPRlxFrwuxJO5exmTqego03SY00Nzs7rfp2VJaLhwJ9uR8g282TJE5FEnCSyYixyVJelmH9Zr3jGpqMbMWsvkyLLKjTtBvFggwRgDXjbFLkBG/0Y5R4kL2Is4JvzjbPCF5mZWg9kBYahwm/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7wC+DmBmm8EW3+WSv/SWzpwmHo703ERTp50QZrgEwc=;
 b=Ev2AxWEZwxXeH4gJ97QrecYAzLcbI4mnEWuEhrcyaNCRw/fYXd/dudTyJ34gEwrFyeHsfv6lgc2T0Ho2xWXw/nVjM4wTJtb2g0M7QZo/n+ZEbvOwUlf6jvW32yXwZ4uVPBmd7i6Mhdwx1eH35qhSZaQZzV2iJyZxfQz2bbWLC2U=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Mon, 12 Jul
 2021 06:42:19 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 06:42:19 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC: Alan Stern <stern@rowland.harvard.edu>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux.amoon@gmail.com" <linux.amoon@gmail.com>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
Thread-Topic: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
Thread-Index: AQHXdizqoaSvbv4TcUGwLN6CtBbUjas+D7KAgADWEQA=
Date: Mon, 12 Jul 2021 06:42:19 +0000
Message-ID: <822c3852-1d15-2976-8672-e49ae34c328f@synopsys.com>
References: <0badab7c-f12e-e9ed-2f90-2cf5f25f4038@bluematt.me>
 <20210628005825.GA638648@rowland.harvard.edu>
 <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu>
 <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu>
 <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu>
 <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu>
 <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
 <CAFBinCDc6RUypJpujmYdkjo6j-xsg0HkZEZGxTCsTW4tZ-bJPA@mail.gmail.com>
 <CAFBinCA083iP4T2b1+MoDGZFKMO8eyy-WceRBA-QibatqboO1A@mail.gmail.com>
 <f084f45a-5be0-9542-260a-f4641e1215d0@synopsys.com>
 <CAFBinCCj5zUiv9LS2jKRxzX5pfcFTr4tVZwR7TA2CRQg68qwTw@mail.gmail.com>
In-Reply-To: <CAFBinCCj5zUiv9LS2jKRxzX5pfcFTr4tVZwR7TA2CRQg68qwTw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: googlemail.com; dkim=none (message not signed)
 header.d=none;googlemail.com; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a48f1af6-420a-4521-2eda-08d94500327a
x-ms-traffictypediagnostic: DM4PR12MB5373:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5373C90D9DFC9D3CD663E10CA7159@DM4PR12MB5373.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r84ulsw/Oy4SXbMl3t/xEJsaXYrL0X+AaFvz1CReUYHw9KvbP3C6ytx8J7m8nARjcx+yJxXiq+cHtZsOXQR4Y1fJAmXrs5Gb8npfCM9w/huCvopXM4c+x6uDc3ljY5/75oAFY4Db8GHVRePKyuq3BPDe7/vX5EsWuZkGA2FfRjaRAnN/00SnqWfmc+WjBUlJNMIMwvVc1LGM1bIH7TM+lPdDN31ONIDODtk9j8T9MSOjgim+rztQPUrbFZ6M2ETgU4q9I73/8BX4518tvQj5jPuQ1dX1YUS4E2QblVvg1DH2OwJdvExRaeiqtI9PAYqUSF0gLM+BtGXqXOa+3r3mOk31hIXeeAgB+VNqtW4A5kYS3XrYfygaSt5qPvyP+LR1z/yQvTD5oiqSqZJ5g8w8YLzeS5bG6UBgljrVb2ZKYwJ87v1G14XFfULqyIhsRbqq+c3tqfh66dx4zwldsrqvHAPIOeWUjEPcZs5cV9hfdFHyKiUyc4MHh5si4Yx4tXttMEzG61SiLdht3FgdCaW7yrwE60RJpYEMBlXVtKTFKaSqfbw7mNDcKZ/Vc+xoVPEWcMULFSVWF+jOaPVsFJmJP+Tz/kh1zWrg+ZS1BnJ2sBW+UHwwb/BOw1qRbDxadokElTwRe+xG+aLJP3SxbNUpeB+xpee8EEDBb9WK/D6j0ZnIR8vWxD/g3Yeq0axP7W7zWjuPh4hFsdgln19PRMtE+fpGOkpTVbkCkklACps20ww=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5390.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39850400004)(136003)(366004)(376002)(346002)(64756008)(66476007)(186003)(4326008)(76116006)(91956017)(38100700002)(2906002)(5660300002)(45080400002)(6512007)(478600001)(66946007)(53546011)(26005)(6486002)(66556008)(6506007)(107886003)(66446008)(86362001)(71200400001)(83380400001)(31696002)(316002)(2616005)(110136005)(54906003)(36756003)(122000001)(8676002)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGExSjA2S1lZVVMzbDd4VVZlTjFqYk5sVlV2M3dQTEdSUXBsOWppL2NYZWN4?=
 =?utf-8?B?NnoyN0lnQ3dIcnF4djNJTndhZy9BZmVlRXN5alFiQkVyRTJGR2tyR1VnQmR5?=
 =?utf-8?B?WS9vVHg1cTZHNWNkSC9FU3lMd1FFY1V0Q0h5dXZQdEVlUFU2bGo5eDlPYlVi?=
 =?utf-8?B?WHhPYTJZQlZUY0hnZ3VCY1V6bHVnb1VUMTJValA2MUp2TGt1Y2FPb2dvNVM0?=
 =?utf-8?B?T09NUVJsRHpvK3BlYmpJS2s1V3pkZ1BnUnpIWWJMaXpQdWYrclNWVTRDblBu?=
 =?utf-8?B?UFdSbjNCUEtVenlwZU1YNU01V2xUV3EyTzVnZG1IL2Y5NU0zQTlzL0RRU2Zy?=
 =?utf-8?B?bSt4cnVvRnZRcXpqQ3JMVnVUU1hLWkpxM2ZDcHFUMzJSV2g4S25lZWorV09R?=
 =?utf-8?B?dlBjL2Rka3pGWkVRbGszdlNzR0NxRG9vM3Y5czZZTHRRTDhDOUhTR1lnQkJW?=
 =?utf-8?B?WDRicW45aHZFV3lsOEZnWmR0RW44MkJvR1N6TjUybkZ0Y2tKYTlFVUh4WjNB?=
 =?utf-8?B?UlZOdXhsYlRLd0lLelFva29BcTNObVIzUTFIdXY2YzFLUUNsZXNwMUpPZnA1?=
 =?utf-8?B?UTh2VEwyQmErL29zQUNTZnJGZUN5STFBUUUzZFhEdFk4NjVKNlVWek1Xb1kx?=
 =?utf-8?B?VEplcXhSbGVYb3FWYnp0VzI5UjhrQjdxaXpDM0IzOHlsZTY4SEVsRTg0WDk4?=
 =?utf-8?B?WE5ZUkN1UFJ4cHM0VFM1aWxpMTEzM0ZDSW9rN3lGRll4ajh4bnp0NVl1bGNN?=
 =?utf-8?B?bXJMbHAvS0g2MW04L09WTW9ZZHRjWnBLRDg5MUVDZUNFemFZL01WTXNUc1lv?=
 =?utf-8?B?L1Y1N0labmZRYlJqeEVPc1EyWk9jSG50WmlkTURvRVQ2cGdLeStyS2MwRys2?=
 =?utf-8?B?dyttZ1VaRDEzemNoUm9SallUa1pxa1Y2NmNLTGpGVyszSWRhaFRobUd6WC9X?=
 =?utf-8?B?enZFN2R0bnU4UDFSZDNSZk5memF3NDUzQ0hTdVVMTkNIUmpSY3haSE1Dd1dO?=
 =?utf-8?B?OG1uUUNDc1ZPeG9MN2Z5QUUzOHdOSmJPMTl4a2UyTkIveU96Vk9mWjAvK1cr?=
 =?utf-8?B?ZUhWeGNUMHIyZnZPM3dtUERQbnp0ODFFckM3R2hvV1NBK0FPdjJ0RHFiSTA0?=
 =?utf-8?B?dnU5UXhFVEVLeXZta2FaTFRCMVd5QXBBYnlXc0RCd3d3QnFXc25zRXFmRTJG?=
 =?utf-8?B?VnhsQ0lpckpUQXB6MFhIZjE3RFlUNDhZSStjMnhDNDhOVWNnU091Q2hCUXcy?=
 =?utf-8?B?RngvTy9WTTFGSmtja2VuZ3FDZFRMdVhmZGdIc1BNNDFvSXlleEZTaU1FMzNj?=
 =?utf-8?B?bEFGQjdlem1TT1l6TDZ6ZnQrcTBwdS85NDMxa2xCem05a2R0bzRlK3VYR0Yv?=
 =?utf-8?B?dWZqc05VbmVvU0VqWk0yMG44TjZzZTU5eWJVTGpwcnFGRkdvQ2tkeHV6VVpY?=
 =?utf-8?B?akEzeUcrSm9GMy91UU53VVNPLzQwWjcrand6R3dFTGhVMUtzMzZpN0M3UXVS?=
 =?utf-8?B?UVZFYmxCYi9QVnMycThkWmNZQnlFaWFFdE1TdFdRRjlHblJuU2FuSnQ3SGJS?=
 =?utf-8?B?UDZyU3lVZUc1Y05xZHlNZWtFTzM3amdqMlRRa0Z1cXFETGNQZzVuM3hCVEJT?=
 =?utf-8?B?RVpBeFF1ZU53MVQzdU5qY3kzVFV2R2NKNEJaamgzMHBjRXVyVUF6cmIwczZM?=
 =?utf-8?B?dUF0QkhPaTRDMm1ETE5OLzFaY0tycUR0NVRMSExzQ2lPVXk4ZlV3MHV0UWRE?=
 =?utf-8?Q?gAoEr/9e3tI2VWo+W4=3D?=
Content-ID: <D59D5016237AA740928DBA1470AFEF19@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48f1af6-420a-4521-2eda-08d94500327a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2021 06:42:19.8103 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +u2WjPraRWUPEQzSJYyHLw/987v0vJWKNuUxnAsdPQtM8ULChgVLyDgUg3JHLJX5JcyQ4E15+XPZqqdbLsqb0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5373
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_234228_446129_D42C8BFB 
X-CRM114-Status: GOOD (  32.98  )
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

Hi Martin,

On 7/11/2021 9:56 PM, Martin Blumenstingl wrote:
> Hi Minas,
> 
> thanks for taking the time to get back to us!
> 
> On Sun, Jul 11, 2021 at 10:15 AM Minas Harutyunyan
> <Minas.Harutyunyan@synopsys.com> wrote:
>>
>> Hi Martin,
>>
>> On 7/10/2021 9:07 PM, Martin Blumenstingl wrote:
>>> Hi Minas,
>>>
>>> On Thu, Jul 1, 2021 at 1:09 AM Martin Blumenstingl
>>> <martin.blumenstingl@googlemail.com> wrote:
>>>>
>>>> Hi Minas,
>>>>
>>> It's been a week since I sent my last mail
>>> In case you are taking some days off: enjoy that time!
>>> Please let us know if you have any questions about this as we're
>>> looking forward to some hints on how to debug (and of course fix!)
>>> this.
>>>
>> First of all sorry for late feedback. I missed this email thread because
>> in the subject there are no "dwc2" and my Outlook not move it to "dwc2"
>> folder of my mailbox based on rules. Today, because of rear count of
>> emails in linux-usb I was able to catch it.
>> I have added "dwc2" word in subject to avoid this situation later.
> Understood - I'll try to keep that in mind for the future.
> 
>> Couple of questions to understand the case.
>>
>> 1. Is it work normally earlier? If it was works fine earlier then which
>> Kernel version and after which version broke?
> I am not sure in which kernel version it broke.
> Commit cc10ce0c51b13d ("usb: dwc2: disable power_down on Amlogic
> devices") submitted by myself made USB hotplug work (at least that's
> what the commit message says and that's what I remember).
> I haven't done any git bisect though yet
> 
>> 2. Do you saw in dmesg:
>> dwc2_core_reset: HANG! Soft Reset timeout GRSTCTL_CSFTRST
>> If yes, then PHY not initialized correctly. Core can't reset if some
>> clocks from PHY are not available.
> I think you saw this in Anand's kernel log output.
> We came to the conclusion that some of his out-of-tree patches broke
> USB for him.
> 
>> 3. During our recent testings we met the issue with PHY driver. Artur
>> found a bug in phy_generic driver and submitted patch on July 10:
>> [PATCH v2] usb: phy: Fix page fault from usb_phy_uevent
>> In your case, as I understand correctly, used
>> drivers/phy/amlogic/phy-meson8b-usb2.c. Could you please check if same
>> issue exist there.
> phy-meson8b-usb2.c uses the generic PHY framework (from drivers/phy)
> instead of the USB PHY framework (from drivers/usb/phy).
> The generic PHY framework does not have any event support.
> I am also not seeing any kernel BUG or WARN in dmesg. So my conclusion
> is that the phy-meson8b-usb2.c driver is not affected by the same
> issue.
> 
>> 4. Can you provide full debug log for failed case?
> sure, in my kernel config I now have:
> CONFIG_USB_DWC2_DUAL_ROLE=y
> CONFIG_USB_DWC2_DEBUG=y
> # CONFIG_USB_DWC2_VERBOSE is not set
> # CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
> CONFIG_USB_DWC2_DEBUG_PERIODIC=y
> 
> With that, here's the output I get (including lsusb -t):
> 1. booting my Odroid-C1 with no external USB device plugged in (the
> USB hub you see in the lsusb output is soldered down on the PCB, so
> it's "always there")
> 2. plugging in a Corsair Voyager USB 3.0 flash drive (nothing
> automatically happened), then running lsusb -vv and lsusb -t
> 3. unplugging the Corsair Voyager and plugging in a USB 3.0 card
> reader (nothing automatically happened), then running lsusb -vv and
> lsusb -t
Could you please set verbose debugging:
CONFIG_USB_DWC2_VERBOSE=y

and repeat test 3. There are couple of transaction errors and some EP 
stalled. I want to understand on which device/ep this happen.

Thank,
Minas

> 4. reboot, keeping the USB 3.0 card reader plugged in during boot
> 
> lsusb -vv is needed to make newly plugged in devices show up after boot.
> This works fine with a few cheap USB 2.0 flash drives and an USB 3.0
> card reader that I have.
> However, with a Corsair Voyager USB 3.0 flash drive this doesn't work,
> I cannot see that on the bus at all.
> 
> There's also a fifth case for which I have not attached any logs (but
> I can do so if required):
> If I have for example the USB 3.0 card reader or a cheap USB 2.0 flash
> drive plugged in during boot then USB hotplug is working.
> Even the Corsair Voyager USB 3.0 flash drive is detected.
> 
> Please note that logfile 2 and 3 contain some "overlap" with the
> previous log in the dmesg output.
> For example: the first two lines in the "dmesg | tail  -n13" output in
> logfile 2 are from the first logfile.
> I did this to show that I didn't omit anything by accident.
> 
>> 5. I would preferred to see output of 'lsusb -t' for pass and fail cases.
> I included that output in all attached logs
> 
> If you need any additional info, logs, etc. then please don't hesitate to ask!
> 
> 
> Best regards,
> Martin
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
