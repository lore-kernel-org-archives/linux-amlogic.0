Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A71EB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jul 2023 05:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftwqACPxKe5tDsxuOabjSS0YecAGYzF2AnKTHUu85tk=; b=mMVQlG8oMxtm0f
	m7dR+8Dkoze9wZgmsijVBk3SIAqN4dqAEDaNH1MFk+pgqs8pDGCbe6deMY6sp+xoSRtf1Kz7L4PGc
	lXsSbf3EeIFp4U502GsEUTIRTMFWEDLB84w+K9mFYNgCEnq9YhVzxm+IbStwi9RbMcm5T4oV5fo+D
	fS82dJVuoSbFQ1Q88OqbFxFmOO3MWK7P1tbGEFLbHtJDUWs12m7WK6Zj7VF046EKLo+RsVTMVwAPv
	FTtXD0toVdl7+a3LTvR8yYzhieBajpCSTgKjGrDfcGvsFfm0G1P8EwRQngSyfYm06W0+oov+gL4CX
	txXfEe6bnD4nULZA5jDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0AA-005SjD-0L;
	Wed, 19 Jul 2023 05:55:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0A8-005SiW-1Q;
	Wed, 19 Jul 2023 05:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=I4nAsYQhP6XB3Tzk40lYX8HD6PUhVxox6d1dLqHAv6k=; b=X7nHZVB4cj+1Ys2BEq43+COCHR
	3OWNaK6xkU7NPce/2vnFYoE9FMYeW3Slp3wdHf0fLk7XIOXHMq9DFwH9h7WzCcwi3O1XRFs53B+rc
	EwVJGnUCS/VXnM8BqC6pt2nyjGB00Zu2ZWqnpGxtOEhFibvHRL++BWFsZRLGltv4aOp0fBh4jL/aZ
	0ziwu/pc68oyto5aNqhetcQiA/hB+UOB0Cksn5DPqApLGnxv8VQSnT7uWYG1QEdNiGbsc4jF19i3a
	Tp0Nhx58JqNecXVaeDjjoXJj5ZHWxbkI5GN363t7gH+FNta81wt7wQmbRyGEUHK3XJ+N1iDPE6Q2G
	B5/7NguA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLcHx-00AcAP-2O;
	Tue, 18 Jul 2023 04:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689654377; x=1721190377;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=I4nAsYQhP6XB3Tzk40lYX8HD6PUhVxox6d1dLqHAv6k=;
  b=yDksGml1MHH6WcP4Edw9irrYqZWVOhKLo3MbPOx+6x9OhR8lEP08o0sc
   XA9kXhKW54DHGPd9/LdcdBEohG1IBdKlLpwFUcCFDt0YK1P8bA4FXiNlt
   Stzi1c+H8zhxMLookVWBVIFIOr+ma3TvD3Tb+LyxAsHqHvrZOlIn/DFEV
   xmwNVdlCI/POOyvii9IQhCSup+/rQUCw44JZ1gq0xJ9R5N4eGQM29GKjC
   mEjTPJnYImXO/I+HsRWeETo1+7ey6kCyl/zlhD2J9xkIZ6VQv9kFqmdQN
   ea73QfDRo7zscmCvYMNOZfTu54YgVKCO9S6I3ceD2b3nSxFKH4sPGh99y
   w==;
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="225154282"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jul 2023 21:24:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Jul 2023 21:24:58 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Jul 2023 21:24:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJkJMP3KZOc+FoluOHm8t9xpa1hDe4aDNif/WdWaVwp4hikTYhZMXN7zDTguxMiiHRHG5nNMlSQtMINW5jo5uAVZ84KPaxA+TXUbaVJ5MUia+1BjaOygoPUAienDi2az1UrmdZRODnOMiT0RJSDjQtqZYHe9QNZH/tna4n7xin7JemuGQq/yNFtPucTqLv6155i9Ts5o1CRYww1UefH6nlf60fy/QPXHl7/KIDe3cgo5kShguDQCs401GEm86z/qIZcrG9nZ7IbMnmWcvLqbL+/xJHDICe4iDnNtvU3GiZ/LzqS3MxxZCKFGaiBVDRizq5eLGjVwrVTxmdgx3by6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4nAsYQhP6XB3Tzk40lYX8HD6PUhVxox6d1dLqHAv6k=;
 b=LWoH5YQ6qmUmkWWJ3yossD1wbQgEfJB0PUCg7ab/KoQaIj4aj15QdHxVCxdQ885N39otdnpNLgoL0OcAtwg+kAWRtwIRkpaCWJ1vPiNMFtEi8+0H7cneYHFYjKjzqa9seCZRb6Q8NEOp+3/CG5/ZoRymU8sW+F7VK4ABhbq0hKO9H7pJJofwD11WWZLNHYadKb/xi4EFKDoFEumUoEgyVlfONQzZMX9oH0R1T0ALf1Prqhi1ysTRvb8+9j/aXXiuAtVABMVaK76Ub8ffT/VsjdBC6JXUrcA+q1/QrWEpO6hfJ3tz8Txtua3jRRSBAAFP8sCF0GLlO2vuetom2kTlwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4nAsYQhP6XB3Tzk40lYX8HD6PUhVxox6d1dLqHAv6k=;
 b=VUPbQ2L5yYbCxEZPJRZF3M5UyeSg11vben11wc/X1gO/pML5Jhcw3qWXOhWmusElZ4hLyTD7odJObu5qbnH+o0RV4hWuuQ7rFnOke6rMaRqYBO91WpFpN6801/qSgIMmxLRiU7eN8fVVmc8bmrF2vGSej4bSNBwbJBn6VQC1hDU=
Received: from DM6PR11MB3532.namprd11.prod.outlook.com (2603:10b6:5:70::25) by
 PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.32; Tue, 18 Jul 2023 04:24:55 +0000
Received: from DM6PR11MB3532.namprd11.prod.outlook.com
 ([fe80::eb5d:6623:d0cf:d5e9]) by DM6PR11MB3532.namprd11.prod.outlook.com
 ([fe80::eb5d:6623:d0cf:d5e9%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 04:24:55 +0000
From: <Parthiban.Veerasooran@microchip.com>
To: <robh@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <greybus-dev@lists.linaro.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <hvaibhav.linux@gmail.com>,
	<johan@kernel.org>, <elder@kernel.org>, <slongerbeam@gmail.com>,
	<p.zabel@pengutronix.de>, <mchehab@kernel.org>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <gregkh@linuxfoundation.org>,
	<linux-imx@nxp.com>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<mripard@kernel.org>, <paul.kocialkowski@bootlin.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <skomatineni@nvidia.com>,
	<luca.ceresoli@bootlin.com>, <Christian.Gromm@microchip.com>
Subject: Re: [PATCH] staging: Explicitly include correct DT includes
Thread-Topic: [PATCH] staging: Explicitly include correct DT includes
Thread-Index: AQHZtnvKYAVGPIr3FU6KOB+0ELtB96++8rwA
Date: Tue, 18 Jul 2023 04:24:55 +0000
Message-ID: <6d6c8412-1511-a780-30f9-f0cc76112e62@microchip.com>
References: <20230714175002.4064428-1-robh@kernel.org>
In-Reply-To: <20230714175002.4064428-1-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3532:EE_|PH0PR11MB4902:EE_
x-ms-office365-filtering-correlation-id: 46f2158c-5116-4078-59e5-08db8746f055
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ekiwjfzW6kXlzAT/O+BBGXhbt8YzhCMcdhcg/Ve6CqotE2RFDGbOUZFE6Sojr5YQBMc7AdcxUuqeGtWyu6EdN6RIkNbVebs3033UgfEFLdjRgSVs8L5f0AVsueHd1sRUy8DOvxJYKhVvTrV+Mhn4KKrXU4s3WNRfzP+NcImoXWkN/chWqIspK1pjqIRykhBOVKgTM8MeGEx/25CJe5RXjaZaUToqAz5GEFz8zt55G+8qVLclEK0fNxYIGKEAZUrO3B1SJTL4T4C1qfG6EEB5JGqBM4BZpRr8JkfZ/kTKr5pvUMC2oKW8raDFjKW8QDoPfm6I8Vv+4kLWYRk8lzEbDPUz89Re22UOsLNn6Mjsp5VCa1MXIvEAOujCT7EoDdyj4YXNmx1bh+S6pwZ4WqczQZLbLKOSsvwyfMo8YrZlhW/A1QS77aTilAgG7gfQ3qqfqPQLTZbPj2o4uigRKKt6hd4juhjaL61290t8erTi4dwkGlQetb8fgFk3sIl9MmI2EobWKlWfK6z01eLTwriKZg7H8iUDlFcjLYEZE4C/QkJLrNevK5NPCyfNUfl0fSXc/DDIZAcpB2Hb9PHUXozvs2ixjuGZoAXNn87iQzySKuPZXi2FSdDsPrRXb/ghVSgvwTJPgATUnccq4jfPo1YCQ5C4f3jVnov9TKhP/kV4zPzB6xo3YjrxApvybqCfqlGm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3532.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199021)(6916009)(91956017)(316002)(4326008)(66946007)(76116006)(122000001)(86362001)(38070700005)(31686004)(38100700002)(31696002)(64756008)(6486002)(6512007)(107886003)(478600001)(54906003)(8936002)(2616005)(41300700001)(8676002)(7416002)(7406005)(66446008)(66476007)(66556008)(26005)(6506007)(71200400001)(5660300002)(186003)(53546011)(83380400001)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0txV003SkNLQnBSSFVGVU92Q3N4bDNDeXE4bm5qTGQ4c3NIUWpGL01mOUZL?=
 =?utf-8?B?akhrQWE5QWQ2eFJjQVZLakFiMlphMW11cG5SNFY3OTgvMmdaRThBODg5MUN5?=
 =?utf-8?B?UWkvUlQ0a2hyZVBkb0ZzRy9iZWtteHRTbkc1bTd5cU92aHhFY1hsZWlhVk1Q?=
 =?utf-8?B?L3ZxckRGU21OcEZ6aFFib0lBNjlYSi9JdFQrY2ZmOVdxN3F4Sit2bTVWYVUv?=
 =?utf-8?B?V2wxZFE2WXdMY2x4YTlPbUNQMUVZalc3eU1jY2hWSmNSZS8zUlYzdTl1QW53?=
 =?utf-8?B?cko2UWI1bFpXSnJ2NGxjK3lEMlF0TWZsYjkvSGZMbDVVTXVPK2ZjYlBWWm5Y?=
 =?utf-8?B?a0lOdjdzWFNYMTBMRzVTbzVaMmJ5eW9qUkxrWmpRY1doN3lYUG5TNHlDTnN1?=
 =?utf-8?B?cDVyTjRSSnU3Z1dsRzZWZDlzQ0ZUek4rdDV5bldka1Vlb3pUWTlObnFOTk5B?=
 =?utf-8?B?UW5xRzJ4UVBqL2dpWDYya3Y2YTdBbm1GQlVUS3N0OXMwRWtUQTNwSlNlNk5i?=
 =?utf-8?B?QjJpZDJXWnFNTzMwWXZWeHpZcldNNlVMdGxKdU42T042cDZ5UWdUU1I4Y29K?=
 =?utf-8?B?Nmk1QkRKOXRTNFZ6Ti9hamc3R1pyT2lCcFlDbWQ3akRlUk1YdTVxYnJEdkhq?=
 =?utf-8?B?V0RXN214SjZFVnVZZUhzdEhQU2M4Vkd1QzYwb29GNWppdHdYVjQ5WHhuQzNh?=
 =?utf-8?B?NERRUW9SWFA0OHhETmpET0VGV3JoQmtrZ3lqWEszOE00dlVBYTlIMHZUdElR?=
 =?utf-8?B?MngwZllpMVFLZ3Bva0xOcTRUdGdLRjNGcE1Td2dBTXpBaDFIekozcUlvTVpR?=
 =?utf-8?B?TkU1WXVTaC9WM0EybEJkdXFoSmVRSkVyVHRML2NUQXQvV09DZlZnbXBHQzA0?=
 =?utf-8?B?TWJEa2R2ZkN1cEtWbmdGV0JkcEdCbDQyTzRreVgvSkFDOE0wdVVYR1RvbTZv?=
 =?utf-8?B?VjdjMVhScTBYNTRwbWlpT0xUTUJjaHBHUDhucWovY0h1VjQwZ1ZOU0lJazcz?=
 =?utf-8?B?Y1J6T3BWM3Fna2swNHBSU0N4bW1mQlByMVdDTVJJOTZsakpZaml3ZGVyTFlM?=
 =?utf-8?B?NHI2WkVJaW5KVjlWRHM3c2NkaDdjNzY1VmpYOW5wNXVPVUd4VnZSWHd5VXRa?=
 =?utf-8?B?UW84VjAvR0NOTEw5QWlMdDZmUS9ET2U1Q3Z2cXdQeCtGcUZ0Mk4xMVZJVlgz?=
 =?utf-8?B?bDF4YW1sRkhxa1RJajhuZUtDRVE5Y3d1bGg1QnNTckZ6RGV4MTMwTWlhcjNK?=
 =?utf-8?B?VW9QVEtYSjNQVkNqT0F6ejlZWDZMenZDRWFEaStNcXdXbVVOcGhwTldmZjJN?=
 =?utf-8?B?ME0wamUxUW1VRzlHblJ5a3FHZG9zZWU2WFRwK1g4djh3SGlPZnZMTHEwQno1?=
 =?utf-8?B?aWRMMGdhenpFZmd4bm5xcGhDUkVHQXJBL3RuUXFySTY4THJ5cFJZS1hFaHB2?=
 =?utf-8?B?OWVtMVBxbHM1UG1uQW5pMVNkL3ZmbHM2TE1oUFliZXZqOTFKQVl0dW96WDdt?=
 =?utf-8?B?WkxOTDR2MnAzdzRkTmIvNUtyOVpRTWppaVZ3QXlrYm4yMVQ2M292aXQzSHlw?=
 =?utf-8?B?bEN0T3p3Q0tLc28xS2M3cHJVQmdDWmtkalNPVlRodFk4SytMRDZUYXhqK2ty?=
 =?utf-8?B?R3Y1OGlqQTZ2OVQ1U3pIcmJUVklBdzM2ZHo4R2FhQXlTMVByM2F0Qm01TStt?=
 =?utf-8?B?NVoreHRRNHZzUURaYUhscW9Demx5MllVNmREY2JONWhtMEI4T0tPWThBNzBa?=
 =?utf-8?B?MUhwR1VYbHNLRTN3cDRPVVhDN3VoaUkyQ1BHRm5FV2x2VDI2cmdlOEkwVk94?=
 =?utf-8?B?dm1JK1hqMmQzUTFodDUrS0FMSStEQUpmS0E4b2dObWFNZUU2ZDZUV2k1NEMw?=
 =?utf-8?B?ZnZOMFdCZXlZT3MwcnpwZmdrOVhmUTFpbVV2L2pjZlBEV2lMTmlRTmxZbFNn?=
 =?utf-8?B?bjlCTlROczZPOEUxK0UrNUFTSnFvNnEzRmExMmYzazVUNE8zVjVlWkh2cFRx?=
 =?utf-8?B?T3U1Y2N2MlB1RHQyUG1BUmxRYzh4Y3RVaTg0OTNwZUY4c1h2WThjQi8xOVVG?=
 =?utf-8?B?cENQUXkvL2dEaTgvNkNxcmE2UXd3TDNhU1RnUVV1SjJLREpnbWhiMm85VzVw?=
 =?utf-8?B?NjNuZ3dNNFNTUkQzNE5sSDBvMUIyYmZmL3lsZFR3dG0rTnh2anUyNUhnSDJL?=
 =?utf-8?B?UVE9PQ==?=
Content-ID: <FE256CBD3FCC5049AF6E37AE74ADD166@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3532.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f2158c-5116-4078-59e5-08db8746f055
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 04:24:55.2046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 701UhUq2eTz4HWMGAoFSeIb/MF/W7z+Oh+cq3UbZVmu9iy8w9K1gNUDNRqIjWeR0s+Tlt3zLQpNjngzybNHlVO0h+253OZscxGXVAqdht0uQIikax3wlIhaeAEcMkyj+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4902
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_052618_553791_6B466E6A 
X-CRM114-Status: GOOD (  14.59  )
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

On 14/07/23 11:20 pm, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   drivers/staging/most/dim2/dim2.c                  | 2 +-
Acked-by: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
> 
> diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> index 44d3252d4612..ed6a9cc88541 100644
> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> @@ -8,7 +8,6 @@
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
>   #include <linux/module.h>
> -#include <linux/of_platform.h>
>   #include <linux/printk.h>
>   #include <linux/kernel.h>
>   #include <linux/init.h>
> @@ -21,6 +20,7 @@
>   #include <linux/sched.h>
>   #include <linux/kthread.h>
>   #include <linux/most.h>
> +#include <linux/of.h>
>   #include "hal.h"
>   #include "errors.h"
>   #include "sysfs.h"
> --
> 2.40.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
