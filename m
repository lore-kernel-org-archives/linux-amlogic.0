Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D80CD80BA
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Oct 2023 11:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFaZeOoHMv9FIPGYNaomJEOxKGZibPuEKVGtRLAqNDo=; b=uGHtcCMBUrBGb+N2C7ZRBOhnMz
	MYceoJ1imvWUSfjEiQJwoH95QLsWtbtcq56dFyw4X0texauqmQyA9KdlhNPIFWuA/LH0CGQLmkCCP
	8khxBLj0A9v4hk431EksRZ6pAPVhOCXekQkiVnsSQnq/me8kMptEBCEnmMo7LcImKbg+39GYG72lz
	8qpOnBzYsu+nHulgfM+7a4I7iI0gi/s0v/+jMcGdlTPeJYH3wmtiQii2EG40L/6YFnLLxrJOOVhE+
	a1h9kyxvqgDrF6HFSy7HUoZURLI01qgJmWYXtF9lOtHTYVlhayFm1w2b+0iDDrdRAGGDc83qJMzRf
	VXiucbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqBLq-00DH6K-0b;
	Tue, 10 Oct 2023 11:56:38 +0000
Received: from mail-psaapc01on2071d.outbound.protection.outlook.com ([2a01:111:f400:feae::71d] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqBLi-00DH4L-1M;
	Tue, 10 Oct 2023 11:56:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqcCxxeRIPE/umL86w+cy2zgbS53ICF1DV92aV2L7XTfLWQe2vbGjm3SxfH6fVGaC/C+yOud6M36esFZkqrEZTrEMrwzowhIJHbp8mC39Qqe02sVMsyvM/d8tUHp3TAai6RDAs03WoDSDcr+tVYaiC/E48j3dqDjDSeXx+y71Jeqdem0/TdBfic61e2ogj69ONahWeyCofFQMYInX2HIDNGdA21YjJlQDn9T/sLmY5+ipEbWU/TMJ641KF/6u2vHqOHA9p8L6LmnMrg3FC6rgtWV4oomptv0FFTjoadtd9Qwi/vKl8Gn4bGjhbF/X7jrzKBo5KTvlWBCDZAfUccBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpPzFjqYkw4TlpQ4SwUuQ90dD1Pw+kj0Ts2ll7uaj3s=;
 b=D7ihmYYONtjI+xeVCsS1EtYRWkfDF13iew0sTOLA2r4Tah+0h8/UxE7Xwg488t6/ChF6SoLRot5fcVnmY5OsffoaCq2YDWVWN5jt5CbLVQa33wnrfXDlxLrPw+pQKTnU5ZS5flWnSb4kFAUXrJaGPl8yUN/amqYdWEaE3sxRqyspJ9EbX3Xg3rzWTjDNM6Ma/cRUzzQThTmBk0ZaqesFEQkJ8F/p/veU2k6NHT7E4RUMZULmFKQeUpo3lDCofRMhoTi8PpGm0oEc1ChJUOUZqjqnILskCf/YiLwPFLRokJBZ8Zvk5AhuTb3EltLNJCYFBjVuA6FdyYaIgpE3jjLV5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpPzFjqYkw4TlpQ4SwUuQ90dD1Pw+kj0Ts2ll7uaj3s=;
 b=XNVliSxa7RN7DlCg4Txq4jvKd0C26eZ2ztziynxkhaM2+PJ1nYBg8rXtf3UMXKriVoGcGciAgR0VUSU6FwqV2ZH89pWpHBeU9BXiuQ6hHds6ETDI7dPiFmTJdI7xlKDiHRPUI48oRxvI1/h5XCDAMkCwGMZDc8TnrzCcNyRSkOs/woJ2d9ddUmo1N1JJ5KAeWaenNt2ldsvM9gw7hStDmlj9CbsJSgGamX2gYAGq2crZt0AOVkSUK8LPf0slNPPWE3jlHRIht/Se0O02U97uD5ZauSnBPLcAS6DgGwRYrGHkgL3aLAv14BltP57OGltUQ7BwPKp2RfCalb3aD2dtFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SI2PR03MB5943.apcprd03.prod.outlook.com (2603:1096:4:147::8) by
 PUZPR03MB6965.apcprd03.prod.outlook.com (2603:1096:301:fa::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.38; Tue, 10 Oct 2023 11:56:08 +0000
Received: from SI2PR03MB5943.apcprd03.prod.outlook.com
 ([fe80::c088:78e7:87ab:dd1d]) by SI2PR03MB5943.apcprd03.prod.outlook.com
 ([fe80::c088:78e7:87ab:dd1d%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 11:56:07 +0000
Message-ID: <d4f3e1fb-e419-4bdf-8fa9-47e60f596a85@amlogic.com>
Date: Tue, 10 Oct 2023 19:55:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: meson-gx: Remove setting of CMD_CFG_ERROR
To: Jerome Brunet <jbrunet@baylibre.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc <linux-mmc@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20230927072544.764285-1-Rong.Chen@amlogic.com>
 <202309271651027503622@amlogic.com>
 <1jil7wkl39.fsf@starbuckisacylon.baylibre.com>
From: Rong Chen <Rong.Chen@amlogic.com>
In-Reply-To: <1jil7wkl39.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: TYCPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::16) To SI2PR03MB5943.apcprd03.prod.outlook.com
 (2603:1096:4:147::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR03MB5943:EE_|PUZPR03MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6aa105-fa08-4a39-4adc-08dbc987e2b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zbxpel9tDGJntKRUuvEP02hj3DiD1F6LCs5O/OCbqW9e8qKET7ea9rIcMrDdq/vjlzRshKh8lN4we0nQObTgtSwXJMr6nAVoxFmkvUIu45+azahmxGTrY69Ah2qPs0QgFW5O3Yo519BY+Rju5QB7Z9IWGqvFvExbI4a64S28uukiOiKnyTcG1XsxJvTylb8KaxOaTL5Lkmw8XtSt8kEwmENZn+16eq7e4J8uEo8FH/1NagJoCyHkiu6ayO1Ce1Hnkps+zgppRg/PUUP1Tks/iBuppcbB57FfzQ5n9FcbZrmjFZUurtM77GTwleFft0g9c+mEELBFQrMx2St7fVyb2u3coIBSGs6vfKStzT6j2f1/fGUzqN2KpuCkI98V2TbAt8DPC339fNBKsupy4mSSbkJvUoFkSp0oKXSTgyADm2Ey9ZyieryKiEJFytjLZqRLqYvUFgSeNDVUkTc0tJxGvs6syN+FX12A3X3nIgMr58o5pCjXQvBKUpQurx2O0eH3sPgki04Sn/GLz2qmTNHkl3RMnf5VjcyMkExIP5oGeqFmRKlK0sS3ZqGU2jXxo1QhDxW1EfMn4Ts15x+ihiHtRoCHD8Iu5rSdqljSFT3anGKTzhnQfZ9Rwn9EYA+yowvPTw5H1JUGDO7nDWa9OschiO2HVOoQCgEWGoJnWl7+okab2ZoSvpNyaeSsyv7IBj7+67kIgpMwiKTbYK8X155GB0GuzITAI8sXc681XzTcfLA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5943.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39850400004)(396003)(346002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6486002)(83380400001)(478600001)(6666004)(52116002)(53546011)(6506007)(6512007)(966005)(26005)(2616005)(31696002)(66476007)(54906003)(66556008)(8676002)(41300700001)(316002)(66946007)(8936002)(4326008)(110136005)(38100700002)(38350700002)(31686004)(86362001)(5660300002)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDZXeHoya2tkd1JVeitPWGZrZTNZR3NKVmdOUjBDbDcyY2pQU1B6VWV4U1Jp?=
 =?utf-8?B?SVJOOWpIb1B0VTNlZkgyNWowbEtuNDM0NFM3M0lUOXNpZ1FqWkVYTnRyQWVk?=
 =?utf-8?B?MkxRQ3pGSThhcVdVSEdQQ25kWXZYenVEM0hEVGVzN1hlVnZjeVIvbm40Q0hp?=
 =?utf-8?B?MHdpZ2wyQTNPUGtPRzdmeVYwLzVja1FUaFdPemVZQlFpT2hFdnhBUnJ4YXJK?=
 =?utf-8?B?RjM0a2VwREZSdk5veE94ZllDdy9FVFRwblJmVHkxRXZac09ZZFkvdktxQ01R?=
 =?utf-8?B?LzBMRFNXM0ZkNUd1Vm1aQVR3ZHRSQmtpMktMVTRlNGMxWDhJWEtPN212Wi9u?=
 =?utf-8?B?ZFQ0b0JTZ2dXTFo0ZGE1Ky9ZZUZvWDhYaldGOEROS1Z6WFphdGN5NGkyay9I?=
 =?utf-8?B?dnpUOUdHaThPam1RNlI1cTJHczMzeVo5Y3dzWVEvakhsekFROTJnT3Eyckc0?=
 =?utf-8?B?eUxzc2NXQ083K0Fsd2JxRTJtQkpqUUZJWDJIMjFxWWtvaDJQV3U4Wjh3Ymd6?=
 =?utf-8?B?ZjFqWC9KUUFPeHZwcXVkQ0JSSEE0b0d5dVUwUTlQcGJXTG1KZWtMSTBMR3ha?=
 =?utf-8?B?QVhMVGlaWWpiWGIzanE0MS9pQWxNL0I4ekx0ZWIzRjhNK2tYeWZUN0ZjRk43?=
 =?utf-8?B?SmpvYjJIVzV5NTEra2JwV1Vvb3l5NUFqeDZ5MEFhSVBkMXg0RVYxc2dvaWh2?=
 =?utf-8?B?VURPWnlWeWJHTTBKRS8rdzYyRXlIM0ZyMUpHMUdxYVdPSmhZKy9ORjdzMndJ?=
 =?utf-8?B?RU9MUG9aUW5FYWNOc0p6ZzJ0UDYyUzVteVQ5dzR1ZGpUbUt3VXJ1SkxVekg2?=
 =?utf-8?B?SXNjUTVKczZObXhMcGxvV3FGamEzMzlZR0tJSEl6ZXFva1h4bGhDNTgxL0hz?=
 =?utf-8?B?ZTcrQ3Ivd0djbXJ6UFZycXMzVjB2QUsySklqejU4NUE2dmhvY1paM1JHMWlB?=
 =?utf-8?B?ejdpTVFSaW83dDBzNGttdG0yUjBzclFyb3dOcFJnR3hwNE15SmFKQUIzVG5u?=
 =?utf-8?B?WHZOaThoRWtUdzFSSmtwSmxpTTZTako5Z0V1b0orSldDcjdYQzZEcVRqTUNN?=
 =?utf-8?B?TWNvK1FLNUhFZkVDaFNqWUxaci9oQmdsT2dMNTc5cnFJbnVIVUpTbGFWUkdH?=
 =?utf-8?B?M2xmTGFsYjVTRXdsMmFDaldMbGpYNUJXcngxNU90cFBWSThWUVovY2xZWW8z?=
 =?utf-8?B?ZHVpV0dZWUx0YmxaV1F3NmI0aXFyQkFsRE9FQTVEdklMTHRpcGZ1bkhjdjMz?=
 =?utf-8?B?T3VFU1lrQUt4dFd4ZnRzRzJOdkZ0dllHREVacWc5d1dFNlZXNGM0ckgxZ28x?=
 =?utf-8?B?djlnSmFjTDQxTnNoWmNLcWI1VmIvejZZZmwvWEhiNVhmV3BUaVN3bzZzamVS?=
 =?utf-8?B?QlFRUUdMRU0xOWNTMFRYdEV3cnJvU2E3eDlRaThwTVRxNDlwTzJGYmdmcEx6?=
 =?utf-8?B?Y0tMVER5UDVyazV6V3I5TS9XV0tSOThNZlV4c1Z5WmI2STJmUGprSElZVENJ?=
 =?utf-8?B?TXNkM3FkcTlNNHM2OTJtKy9xNjQ5ZExHazhqNDdheGx3RUVNMENCUkUwOW1Z?=
 =?utf-8?B?MXVaa3FZWnhjWTN2bzFnbllYblNrYlBtb0ZaMEttTUtaeGYrYVZodFNtNlZC?=
 =?utf-8?B?RWlaTW9wSFgzSGhYeFZYdWlCMjlyVlBCSFpndGh4R2Y5Y0R3cTRRaFBKUU5u?=
 =?utf-8?B?SkZMNEh4WnFIc1NHYVJZc2lzOTBRdjJmczRyRzRQWG1JMEZJa29HYyt2cWh1?=
 =?utf-8?B?WGhKcWNOTnd3SjlDMk5YMHNpVnViNlBBS1N0c2NXS25mcDBWVUpWQ0JwcGxp?=
 =?utf-8?B?emVCQ1JjZmZHR1F6aFBJUnFFSVRLeWQwbWEzMjdSbUVuU2d6WnFOMHBJeDE1?=
 =?utf-8?B?bUJHUTBYWmlicE0waGNkcHh3bnlCOFFzL1dPcVZEY1M2WnV2YTYzUWxIdUF2?=
 =?utf-8?B?bnN0L2pSc2J3YTc1dDBHcmFZTkhGWlc4SVpxbVdCQnBrbWQ0ZVllTmp3anRu?=
 =?utf-8?B?VmRTVXlUNTdrNEJjd0hxMkNUMnZOZ1NlZmloblM4TkpEYUFVMXErLzJqNm8z?=
 =?utf-8?B?UGIrSmlrdjY0U0lON1hzSGMvdVg2SXNNUHFBRVg1aFQxaXI4NytJUVV3emVk?=
 =?utf-8?Q?JxyKXaQi7xv90qVFRscoyPMj9?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6aa105-fa08-4a39-4adc-08dbc987e2b0
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5943.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 11:56:07.0854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sT14UKKGj/QBii5+vzwSDyCt4DSTOdLOoTXCQSl3W+aqXJ8bqAC7rDMT3ixarEy41dOFCsoZ+GIMbjMO4yKB+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_045630_520039_E632D824 
X-CRM114-Status: GOOD (  29.79  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgSmVyb21lLAoKRm9ywqB0aGXCoHQ3wqBhbmTCoG9sZGVywqBTb0PCoGZhbWlsaWVzLMKgdGhl
wqBDTURfQ0ZHX0VSUk9SwqBoYXPCoG5vwqBlZmZlY3QuClN0YXJ0aW5nwqBmcm9twqBTb0PCoGZh
bWlsecKgQzMswqBzZXR0aW5nwqB0aGlzwqBiaXTCoHdpdGhvdXTCoFNHwqBMSU5LwqBkYXRhwqBh
ZGRyZXNzIAp3aWxsIGNhdXNlwqB0aGXCoGNvbnRyb2xsZXLCoHRvwqBnZW5lcmF0ZcKgYW7CoElS
UcKgYW5kwqBzdG9wwqB3b3JraW5nLgoK5ZyoIDIwMjMvOS8yNyAxNzozMCwgSmVyb21lIEJydW5l
dCDlhpnpgZM6Cj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4KPiBPbiBXZWQgMjcgU2VwIDIwMjMgYXQg
MTY6NTEsICJSb25nLkNoZW5AYW1sb2dpYy5jb20iIDxSb25nLkNoZW5AYW1sb2dpYy5jb20+IHdy
b3RlOgo+Cj4+IEhpIEplcm9tZSwKPj4KPj4gU29jcyBjb250YWluaW5nIHByZXZpb3VzIGNvbnRy
b2xsZXJzIGFyZSBneGwsIGd4bSwgZ3hiYu+8jGcxMmLvvIxnMTJh77yMc20x77yMYXhnLCBhMe+8
jHM0IGFuZCB0Ny4KPiBUaGF0IGlzIG1vc3RseSBhbGwgdGhlIFNvQyB3ZSBrbm93IG9mIGluIG1h
aW5saW5lIC4uLiBUaGlzIHdoeSB0aGUgd2F5Cj4geW91IGV4cGxhaW5lZCBpcyBjb25mdXNpbmcu
Cj4KPiBBbmQgYmVsb3csIHlvdSBzYXkgJ29uIGxhdGVzdCBjb250cm9sbGVycycsIG9rYXkgYnV0
IHdoaWNoIG9uZXMgPwo+Cj4+IFRoZSBiaXQgQ01EX0NGR19FUlJPUiBpcyB1c2VkIGZvciBzZWxl
Y3RpbmcgU0cgTElOSyBvZiBkYXRhIGFkZHJlc3Mgb24gbGF0ZXN0IGNvbnRyb2xsZXJz77yMYnV0
Cj4+IGRhdGEgYWRkcmVzcyBkb24ndCB1c2UgU0cgTElOSyBhdCBwcmVzZW5077yMc28gaXQgd2ls
bCBjYXVzZSBhbiBJUlEgYW5kIHN0b3Agd29ya2luZyBvbiBsYXRlc3QgY29udHJvbGxlcnMuCj4+
IFRoZXJlZm9yZSwgcmVtb3ZlIHRoaXMgc2V0dGluZy4KPiBOb3QgdG90YWxseSBzdXJlIHdoYXQg
U0cgTElOSyBidXQgb2theS4KPgo+IFdoaWxlIHRoZSBjaGFuZ2UgaXRzZWxmIGlzIGZpbmUgeW91
IHJlYWxseSBuZWVkIHJlZm9ybXVsYXRlIHRoZSBkZXNjcmlwdGlvbi4KPiBCYXNlZCBvbiB5b3Vy
IGV4cGxhbmF0aW9uLCBzb21ldGhpbmcgbGlrZToKPiAtLS0KPiBGb3IgdGhlIHQ3IGFuZCBvbGRl
ciBTb0MgZmFtaWxpZXMsIHRoZSBDTURfQ0ZHX0VSUk9SIGhhcyBubyBlZmZlY3QuCj4gU3RhcnRp
bmcgZnJvbSBTb0MgZmFtaWx5IFhZWiwgaXQgd2lsbCBzZWxlY3QgU0cgTElOSyBvbiBlcnJvciBi
dXQgdGhpcwo+IGlzIGNhdXNpbmcgYSBwcm9ibGVtIHdpdGggdGhlIGRhdGEgYWRkcmVzcyAuLi4g
YmxhYmxhYmxhCj4gLS0tCj4KPiBQbGVhc2UgZXhwYW5kIGEgYml0IG9uIHRoaXMsIHRyeSB0byBt
YWtlIGl0IGNsZWFyZXIuCj4gQWxzbywgcGxlYXNlIGluc2VydCB0aGUgcHJvcGVyIGZpeGVzIHRh
Zwo+Cj4gTGFzdCwgbWFrZSBzdXJlIHRwIHJlcGx5IHdpdGggcGxhaW4gdGV4dCBlbWFpbHMsIG90
aGVyd2lzZSBsaXN0cyB3aWxsCj4gZHJvcCB5b3VyIHJlcGx5IGFuZCBwbGVhc2UgZG8gbm90IHRv
cCBwb3N0Lgo+Cj4gVGh4Cj4KPj4gVGhhbmtzLgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IFJvbmcuQ2hlbkBhbWxv
Z2ljLmNvbQo+Pgo+Pgo+PiAgIEZyb206IEplcm9tZSBCcnVuZXQKPj4gICBEYXRlOiAyMDIzLTA5
LTI3IDE1OjQzCj4+ICAgVG86IFJvbmcuQ2hlbjsgVWxmIEhhbnNzb247IE5laWwgQXJtc3Ryb25n
OyBLZXZpbiBIaWxtYW47IE1hcnRpbiBCbHVtZW5zdGluZ2wKPj4gICBDQzogbGludXgtbW1jOyBs
aW51eC1hcm0ta2VybmVsOyBsaW51eC1hbWxvZ2ljOyBsaW51eC1rZXJuZWwKPj4gICBTdWJqZWN0
OiBSZTogW1BBVENIXSBtbWM6IG1lc29uLWd4OiBSZW1vdmUgc2V0dGluZyBvZiBDTURfQ0ZHX0VS
Uk9SCj4+ICAgW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBqYnJ1bmV0QGJheWxpYnJl
LmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0Cj4+ICAgaHR0cHM6Ly9ha2EubXMv
TGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0KPj4KPj4gICBbIEVYVEVSTkFMIEVNQUlM
IF0KPj4KPj4gICBzCj4+ICAgT24gV2VkIDI3IFNlcCAyMDIzIGF0IDE1OjI1LCAiUm9uZy5DaGVu
IiA8Um9uZy5DaGVuQGFtbG9naWMuY29tPiB3cm90ZToKPj4KPj4gICA+IEZyb206IFJvbmcgQ2hl
biA8cm9uZy5jaGVuQGFtbG9naWMuY29tPgo+PiAgID4KPj4gICA+IFNldHRpbmcgYml0IENNRF9D
RkdfRVJST1IgaGFzIG5vbiBlZmZlY3RzIG9uIHByZXZpb3VzIGNvbnRyb2xsZXJzLgo+Pgo+PiAg
IFdoaWNoIHByZXZpb3VzIGNvbnRyb2xsZXJzID8gdjIsIHYzID8gQ2FuIHlvdSBsaXN0IHRoZSBT
b0NzIHBsZWFzZSA/Cj4+Cj4+ICAgPiBIb3dldmVyLCBpdCB3aWxsIGNhdXNlIGFuIElSUSBhbmQg
c3RvcCB3b3JraW5nIG9uIGxhdGVzdCBjb250cm9sbGVycywKPj4KPj4gICBJc24ndCBpdCBkZXNp
cmFibGUgdG8gc3RvcCBvbiBlcnJvciA/IHNlZW1zIGxpa2UgYSBzYW5lIHRoaW5nIHRvIGRvLgo+
Pgo+PiAgID4gVGhpcyBiaXQgaXMgdXNlZCBmb3Igc2VsZWN0aW5nIFNHIExJTksgb2YgZGF0YSBh
ZGRyZXNzLgo+PiAgID4gRG9uJ3Qgc2V0IHRoZSBiaXQgQ01EX0NGR19FUlJPUiBhbnltb3JlIHRv
IHJlc29sdmUgdGhpcyBpc3N1c2UuCj4+Cj4+ICAgSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB0
aGUgYWN0dWFsIGlzc3VlIGJlaW5nIHJlc29sdmVkLgo+PiAgIENvdWxkIHlvdSBwcm92aWRlIG1v
cmUgZGV0YWlscyBwbGVhc2UgPwo+Pgo+PiAgID4KPj4gICA+IFRoZXJlZm9yZSwgcmVtb3ZlIHRo
aXMgc2V0dGluZy4KPj4gICA+Cj4+ICAgPiBTaWduZWQtb2ZmLWJ5OiBSb25nIENoZW4gPHJvbmcu
Y2hlbkBhbWxvZ2ljLmNvbT4KPj4gICA+IC0tLQo+PiAgID4gIGRyaXZlcnMvbW1jL2hvc3QvbWVz
b24tZ3gtbW1jLmMgfCAxIC0KPj4gICA+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+
PiAgID4KPj4gICA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5j
IGIvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYwo+PiAgID4gaW5kZXggOTgzN2RhYjA5
NmU2Li5jN2MwNjdiOTQxNWEgMTAwNjQ0Cj4+ICAgPiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L21l
c29uLWd4LW1tYy5jCj4+ICAgPiArKysgYi9kcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5j
Cj4+ICAgPiBAQCAtODAxLDcgKzgwMSw2IEBAIHN0YXRpYyB2b2lkIG1lc29uX21tY19zdGFydF9j
bWQoc3RydWN0IG1tY19ob3N0ICptbWMsIHN0cnVjdCBtbWNfY29tbWFuZCAqY21kKQo+PiAgID4K
Pj4gICA+ICAgICAgIGNtZF9jZmcgfD0gRklFTERfUFJFUChDTURfQ0ZHX0NNRF9JTkRFWF9NQVNL
LCBjbWQtPm9wY29kZSk7Cj4+ICAgPiAgICAgICBjbWRfY2ZnIHw9IENNRF9DRkdfT1dORVI7ICAv
KiBvd25lZCBieSBDUFUgKi8KPj4gICA+IC0gICAgIGNtZF9jZmcgfD0gQ01EX0NGR19FUlJPUjsg
Lyogc3RvcCBpbiBjYXNlIG9mIGVycm9yICovCj4+ICAgPgo+PiAgID4gICAgICAgbWVzb25fbW1j
X3NldF9yZXNwb25zZV9iaXRzKGNtZCwgJmNtZF9jZmcpOwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
