Return-Path: <SRS0=cPU3=MG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B400FC07E9A
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 15:27:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59658610A7
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 15:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59658610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/FLKic8rYjXWOr7pgLKZX8jScaIBpjE+RpwJg4t54M=; b=3mo3q1l0HQX3NB
	p3PrqSJorEpx7XHhpwX56lXveZSL/mAMBYShbCTAGR72cArmtU9rNiG8U0d4x217Vwa+oHNn547HR
	Z9SewWumdH0g5TEVwSYnTWOra0Ypzdaa3aMf/YQvZm3b+iTe8i6YSwUIXf3PzRP/n/MxdGXb6QWZI
	fvhW3M4a8Gq+rwVqVG+rSZzrtA6kQgQ7dEdQKlKbQ7l0DuDCFABTAmT9uR8gY9T26QZxVgbn9IoM1
	zsm+A3S1M6q/3Bm8N6O6FX5KKqKiSuCXx6BNTtSZI5t1Rp2mRmnpxN77x/9gzpf8YDc/srow79bjX
	RjYJvfF1eilVzwB9GSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3gnR-00DxTY-0K; Wed, 14 Jul 2021 15:27:37 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3gnO-00DxSU-SZ
 for linux-amlogic@lists.infradead.org; Wed, 14 Jul 2021 15:27:36 +0000
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9E69DC0B9D;
 Wed, 14 Jul 2021 15:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1626276451; bh=T3XVP31qY2mmzNKaPWtfkxY230EiRtZKhsBJ1A+PMq8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=C6AWHd+nuNsZCyyovYGSiEvStOKJY3dzCZC8EUtkD6Fv0HGPeUNz4SsF6ALRa9Sva
 YFCluCHsVl35xBc+MwrQbnvBrXPH+sU+xlZhPWJy3WerYXlvbpKI2cnfQPhGjmuX3g
 /5FK/t+omB9PTu06BS/krKEt4olbwO3BIJVu7nAn/mtkjNM/yeI62xoLrPydAIt1CU
 L3tkdkRvUmNHrc65amvegNNX39pn4yvj12FK+fuQJyt/LDcUTOqRk9VYQKWC5vOPgj
 p7aA+x3kaoEpujjitIEj7p2zsvbWnP7JJxNe6PZ7fMCwIxC4Z1csUCoQxCOy2PXX1S
 LYnGcYG/C9Y/g==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id C6DC3A0081;
 Wed, 14 Jul 2021 15:27:28 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8A246800A8;
 Wed, 14 Jul 2021 15:27:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="c+Wc4WpR";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdHuOG1F7lcQ3soDPfd3k/btorQzuox56n+7+mtoZTTQUV20FVzkpyEJ7szgURNdFSykMH0Tpeg/A0tuhpxjuBTRMuA9JRW4tDSNu20U0tjIZN3E8IcvYcJcA2Vv5wqsJr2jmV3Nvn/iIi1oLXvNxo3oyhIAy1WtQT2/H0VtBYEVOFD4EPlI5h2mheffCgTubPXHqX7sl5Hz6EPSqzOYtJ6/S1Oe3Qekj+qnjxNSV1o0A9y6eq4f7kXF/zcmpzI5jiZ+g+BblKbolf42IyAm6zgFI0UnS890QQ+0ufyo/ipr6ecODk2jhzQn2raxH7Lin4MLku+yb3PkaGsYcCYKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3XVP31qY2mmzNKaPWtfkxY230EiRtZKhsBJ1A+PMq8=;
 b=P5KzrnOE+pINw7Npu3A+L2XwQ9gb6BFsb107S7irPrVFhJujwupMKXBlgKd+aELm+D20v5lTDG9tKhA0vQGO1SKzSbYOpH1js8mxFMttM7RKeXpi0aF6IWJkpyNxJ7vDUD1ROLG505PFMAWPzNOAP+2Rp5Q/EYsdKQlKkWPPHTqcSKqJfOgO7I7DKZKMR++0UpJ3NVPtQjumQEvelf6sucFOhe6mWOfz3yAFwa7fgdMncEWedVJmarqA8jPG06TT/oV2+/w4TZ7ifN3rAkaqXvH0iptq1Nc6/q+8VqHkoWZaOtaI0AtBT++KhdR4mrReT9Az3N43L4OXbqwb+ko05w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3XVP31qY2mmzNKaPWtfkxY230EiRtZKhsBJ1A+PMq8=;
 b=c+Wc4WpRwQmhy5TNjvQ9BjuH+NKirMU0VyFJdMcsCef2lno8sIgv0gDxRubDexfN4YaxOuGzFRNHdhJRlaGzaSDC+zPV3t3+ej5vgUXKp5UJbzRAs1fdagS7zWQrFswEYbG/IhiGSDRL/RVeEoKALW3r3p8Qz6vCTZSRcyR1JSU=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5263.namprd12.prod.outlook.com (2603:10b6:5:39b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 15:27:25 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 15:27:25 +0000
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
Thread-Index: AQHXdizqoaSvbv4TcUGwLN6CtBbUjas+D7KAgADWEQCAAFHgAIADZYAA
Date: Wed, 14 Jul 2021 15:27:25 +0000
Message-ID: <ad475275-eb2c-6309-fc59-494f94bf0605@synopsys.com>
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
 <822c3852-1d15-2976-8672-e49ae34c328f@synopsys.com>
 <CAFBinCC_0RpCMsj3AUt9fZrjHi6_qFirQtRR1g5VJcn45GpWAw@mail.gmail.com>
In-Reply-To: <CAFBinCC_0RpCMsj3AUt9fZrjHi6_qFirQtRR1g5VJcn45GpWAw@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 999e8811-58f7-4dfe-bddf-08d946dbe238
x-ms-traffictypediagnostic: DM4PR12MB5263:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB526383A999BEE5DB7A667FBAA7139@DM4PR12MB5263.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HffxZVtY/FWyAEu17DZVzF1SF/6Y7ptr+5A2Yo9W9mbEGyKxcoxthy7sN2wJC1eO8swQnanxAqIhQJwpxrBdTN21Rq51ZX77IslpphHIfZKxIjdZi6kIMZNlyPYPbQQ9iwHtrprtq8Co1QqJg0d1pUA75Kuz+QNGjbabwtdo2XADVCe0CyNAy+kCTvIuGHOldGrToccFCxaQTey6wW8ySdi7YK0T50oJwQ29Fc2hd3todn59LaNGtWq4u5gf5npsh74sPhYWT8V1WxrS7+C6OGyNK30ilhFoYuiRuuNjeT0psUwiAPb8dKSoBmRiFasrmzlBFKOCu5UtvbflYuCuW5aC1N+Ty6973LnVp3MuiNd1y1oEi+LISYTv4jQiDd3ReEBC75J4r1L54dHP6gd0TqVER41kiCwupiDhSTqugH8KqUAyDI1RNz5jQJjfN2S/aSSUeY2OZa+9PkoygBv43HWKKRiHGpPWsHXqpEB17mEUInIksmtbK71yuOAEiP6332lNr6zRycfN7AvMGxw7v1hi9WjdxLghqvTb3mXFmwvPebOMGp0qICPDd7SIB6SD5wOc0AxfCSSG1EQNTlelJzJObCFZi1TPOOuMbv/PY0P09Ipod42wVS0AwtiaYoOjsYAM5DMy22Esrxw7bUnBgKU9uTKt8qM6wjP8CWiaoYNEXUBuf9VJkVhxx0bJJyvbfbRG7AtgsZDPiew5X9iAb+Y1TQRpbUqOAYeRzAOSqHMXkWPZPF5OFa7iSaCYlrjcr9AH8NTL/89s676DTtXBEFG+dqTB7NwDWBejlWHxgjEtPThMUaTji96YI4O09N8LLAsbvWAHNb9x8ZO13r6C1C4FwEH/tbn0rWyOKO8g/Ac=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5390.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39850400004)(366004)(136003)(346002)(2906002)(86362001)(36756003)(71200400001)(83380400001)(26005)(107886003)(122000001)(38100700002)(5660300002)(2616005)(4326008)(6486002)(54906003)(186003)(478600001)(6512007)(8676002)(66476007)(66946007)(66556008)(8936002)(110136005)(316002)(66446008)(966005)(91956017)(31686004)(53546011)(31696002)(6506007)(76116006)(64756008)(38070700004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVJNY0toVXdocUhhN0xrdmNtbVhFL2F6ekhndWw4ZU5qeGw0ZzZDTXkwaFdq?=
 =?utf-8?B?czRqZkZxZGt6aEkrSFViODBDOW1CM2xXTE9QTU5WSUdqdU5rNzhaZmNrR3Rj?=
 =?utf-8?B?b0YxbjdxbHVMMmlJYS9IaVlMVFFiWmpSNnFLb0JLVnI3YUc2aHkxWmtoSEFK?=
 =?utf-8?B?ZEFOOGNWZTVTcHBhakVEUHQ4d1AvR3pEMUhjY1U2UzhoWThiUGxDdWVaU0tL?=
 =?utf-8?B?bFlHYm9BNlZaSXRibk0wTW96N2xKN3FKWlhBMHVSdHI1aW9ieEhybmFZTDVK?=
 =?utf-8?B?eS9Jci9NaC90by9QQVl4aGZRTlg5K3NYWW04TEhTWVdJZUJXd0NYN25ZRS9C?=
 =?utf-8?B?MDRuU2N6TnF0Nk56NU9QYjgxejVmZnJOdlFaQmJtVmMzSGFKTkNEekpIZXEv?=
 =?utf-8?B?MG1rMTV1MXRoa2tPUklPbHRNVDFGZ1JDMjV6cVZEdkd4cmt1aEszcHVYR1hw?=
 =?utf-8?B?MFpFTUkrZmpkT2hid2tHMHY1aUx2K1ZpYlhoRXpKd1IybVRVV3ZMTTYra1Qv?=
 =?utf-8?B?RXQrallKNnA0Q1pGODdLajVJQnlLd1dub1dLWlNPbkV0YVZwQjVKcWtlSWRR?=
 =?utf-8?B?STUwd3huT3ZkSTV4Z3FJZVVVN2xnNnd2Tk5qNFRXeU1mbUpVc0VSc1JzUlk0?=
 =?utf-8?B?TFlidkl3VUdzQmYwSHZaZzVrUllQeUV0S3AxekxXeWp5R1ErQ3BjUnhxZE5D?=
 =?utf-8?B?WkZ5dXA4QzZadzVWYkZPL0todzdGaXIvdEpIZ3ArY0h3NTVPdjFNZjNJZnNv?=
 =?utf-8?B?ZWlldTNJdk5DUGM0MFNvYUtGVjJacUl6ZDZzYWxRK2JQSG53aFBTMlJQUDd3?=
 =?utf-8?B?a1JPOUFIUy9PWDltbG51c2k3T20yNmhaallkQTA0cHJGcU1ZaFNNNWdYTUtD?=
 =?utf-8?B?aVE4VkpwR2EyMDE0SlF5ck1HdXNOMWp2TWZTRTBQSXUxUjVldDFCSUtuaGpJ?=
 =?utf-8?B?M3FDa2o0SExRL0lnc2pRREdEaE1uMDdQQU15U3U0QUNCSkwwd1J2ci9ZM0Er?=
 =?utf-8?B?RVZZRXd3YklXbHhJaFVwTU5DYm9VWTF1ZFplSFh1WUw0dGoyNklVdkNKTFJh?=
 =?utf-8?B?OUo2bktORklyTEg4MHJyQjNXN3ZnL1FsdGhhVUhpZ0VtMEtJQnBPcWJhZ3lT?=
 =?utf-8?B?cXliaUdhN2VHVFBad3pBRm00OXJnRS9tY01Wdm15OHFXd0J2S1lVNU11RTk0?=
 =?utf-8?B?OXRtUG9hL2RpNzlOc2JrYk9LZmdaZDJRZkVzK3lBeVo2UFVNVzBpVUpacjFw?=
 =?utf-8?B?cGwvdi94TjdqbkU0bWZNbURGYkhiUjZQakxWbFRidDZFWDgyL1BmQmY2RGcw?=
 =?utf-8?B?eGVoWW5oRVdQRWMrKzdsM2xtSTZreFlXbzh6ZkhwRTF0bHpLOVMrRlI1RDR5?=
 =?utf-8?B?QnRvNG1sTC9zUmRNZmh4SUdMVnhrOW8rWDlDSE5pWmNhVFlyd3VLeWxWOUNZ?=
 =?utf-8?B?VHppdlRsbnpoZTQ4ZGQ2R3F6cnowK3d0ZHJlUDV0UGJaUTRObTJ2LzQ3OTJF?=
 =?utf-8?B?bGZuODk5QW5wczN1N2hwVllGc0U3RmQ2RGZxSEM0aWhMUEZDYloxMDhrdWt4?=
 =?utf-8?B?WWJiSUFNL2ZIbXRJb0M3SE9xa3JYdDcrSXZCdi9rRk1OOCtjVnR1bEQyNytT?=
 =?utf-8?B?SFpnUFhqOURHVGw4R2MwSWhOSjVtQTlTdjE0UTMvU0Q4d2tYUFdJcHc4Sysw?=
 =?utf-8?B?ZFEvcHRmM092b0dSbE92VVZab0xqd01PaW93YVNXb1VoeDVGTWJ1Nkx6cnlo?=
 =?utf-8?Q?bJtftTYjQY917Aan6w=3D?=
Content-ID: <DCDBAE08BD91814DA46ACAA3A66FE11A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999e8811-58f7-4dfe-bddf-08d946dbe238
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 15:27:25.6170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5fETIQQFqAerlNYxjaGgYI5AB1vTKXIRenyXje0phigOn9bS+ZpCYg+uH3pB69x0em/B/YoRVwWXvgramrEpEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_082735_094435_1E189E64 
X-CRM114-Status: GOOD (  15.92  )
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

On 7/12/2021 3:35 PM, Martin Blumenstingl wrote:
> Hi Minas,
> 
> On Mon, Jul 12, 2021 at 8:42 AM Minas Harutyunyan
> <Minas.Harutyunyan@synopsys.com> wrote:
> [...]
>>> 3. unplugging the Corsair Voyager and plugging in a USB 3.0 card
>>> reader (nothing automatically happened), then running lsusb -vv and
>>> lsusb -t
>> Could you please set verbose debugging:
>> CONFIG_USB_DWC2_VERBOSE=y
>>
>> and repeat test 3. There are couple of transaction errors and some EP
>> stalled. I want to understand on which device/ep this happen.
> sure, I attached the dmesg output (gzipped, since it's uncompressed
> size is 1.5M) with CONFIG_USB_DWC2_VERBOSE=y
> The lsusb -vv and lsusb -t outputs are the same so I did not attach them again.
> 
> 
> Best regards,
> Martin
> 

Per our understanding this issue is because of power budget and 
autosuspend functionality.

Autosuspend. Please review this patch: "usb: core: hub: Disable 
autosuspend for Cypress CY7C65632"

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=a7d8d1c7a7f73e780aa9ae74926ae5985b2f895f

It's very similar to your case. Actually you already tested 
usbcore.autosuspend=-1 and it's helped you.
Could you please develop same patch for your soldered hub and test it.

Power budget. Old, cheap flash disks required about 200-300ma, but most 
of USB3 devices require 500ma. It could be serious issue to explore this 
devices with USB2 hubs. Even if this type of devices will successfully 
enumerated on EP0 without power problems, after set_interface when 
enabling multiple EP's (i.e. BULK IN and OUT for mass storage) power 
requirements should be increased which can violate USB2 hub port rules.

Thanks,
Minas


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
