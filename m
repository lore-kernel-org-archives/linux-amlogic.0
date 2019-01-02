Return-Path: <SRS0=W3Hy=PK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E951C43387
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jan 2019 21:01:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BF3521479
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jan 2019 21:01:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R62a/aAt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nio365.onmicrosoft.com header.i=@nio365.onmicrosoft.com header.b="G56ywN6X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BF3521479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ni.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:
	In-Reply-To:References:Message-ID:Date:Subject:To:From:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4v/P8CfTrfqETsIxYFIIlyixujeqoIwbRmo0/pWbkNU=; b=R62a/aAtpZVlQx
	/omyHs6XPE/Fn6DLf9DvWtfGZWk/kwojXOFqC9HMUw2W1G4lPiqUE4z1mcKziKX/B7gVyOucw7RV9
	KOI9UVx8TqdxXdt1W/vO0qBawaUu13RVH0h3/fzITcTrhQzI/xIXXoANCtEkmBQUylCSFe1fX6Kf7
	G8caMzg01d6vFHB4BvLH7bxJAf7cc3u5s6bDXWTVtCYuWxoHY1IIkn5KM9YcHeW53l8qC4creg8iE
	K8UJWoUx2mgK83QFwMDpCCJjZmRbc0Tw4hHcoBWt2Ua7RFYs9+pR+fH4Y1W+CtNMe5Bf455BgU93n
	JuOjgzI0t+YPUGJOPEEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gene8-00061I-0f; Wed, 02 Jan 2019 21:01:48 +0000
Received: from mx0a-00010702.pphosted.com ([148.163.156.75]
 helo=mx0b-00010702.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gene4-00060i-Lz
 for linux-amlogic@lists.infradead.org; Wed, 02 Jan 2019 21:01:46 +0000
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
 by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x02L0wD2023104
 for <linux-amlogic@lists.infradead.org>; Wed, 2 Jan 2019 15:01:40 -0600
Authentication-Results: ppops.net;
 dkim=pass header.d=nio365.onmicrosoft.com header.s=selector1-ni-com
Received: from nam03-co1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2056.outbound.protection.outlook.com [104.47.40.56])
 by mx0a-00010702.pphosted.com with ESMTP id 2ps1ncggk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Jan 2019 15:01:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector1-ni-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67TcenH3xgfkB6dMrtZmOOeXRM2PaJRv+lSK8Otf3Hw=;
 b=G56ywN6XoPb63KDCVOK8mZZt0Z1PPwscHtGcnKTjLWlE2Mmd8U+9D/9JO/2MpM4J4U0jslyIkvG5HJJZzrYtsdvzZmDO7ZMeUX/KIjr5qQO3OO3G9BcF8sRKlMr5/2hEp4lBUpTT1b3B5XSP45eTt2IQVoOTqJJDGkbskGEgFYc=
Received: from DM5PR04MB0381.namprd04.prod.outlook.com (10.173.169.14) by
 DM5PR04MB0507.namprd04.prod.outlook.com (10.173.170.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.6; Wed, 2 Jan 2019 21:01:37 +0000
Received: from DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::dca4:420f:c838:206c]) by DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::dca4:420f:c838:206c%9]) with mapi id 15.20.1495.005; Wed, 2 Jan 2019
 21:01:37 +0000
From: Joe Hershberger <joe.hershberger@ni.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [U-Boot] [PATCH u-boot 0/2] net: designware: add meson meson
 compatibles
Thread-Topic: [U-Boot] [PATCH u-boot 0/2] net: designware: add meson meson
 compatibles
Thread-Index: AQHUeDd1JQbh1iqebkmN6rX5LCymHaWczCWA
Date: Wed, 2 Jan 2019 21:01:36 +0000
Message-ID: <CANr=Z=ZUEaEihfqN14nma3TM0XomEZidtb0F6dU1NRBB2vFDPQ@mail.gmail.com>
References: <1541773260-16197-1-git-send-email-narmstrong@baylibre.com>
In-Reply-To: <1541773260-16197-1-git-send-email-narmstrong@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::20) To DM5PR04MB0381.namprd04.prod.outlook.com
 (2603:10b6:3:9d::14)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [209.85.166.172]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR04MB0507;
 6:IISTj6QM/zRRdo6kiwKcDUQEaGEvicc1hlBcFwdb5HLQYOUDDsYbAsgp+3+NW09c180mUCcbEOHJH0L32UsWToDIcagyI1sxWvht+uzfPYueDHDRK143rpWwwnOpNN6im63Gs9tIB4Mq+y3g6KB51gkK/UPMefgODHljko+3IB/vJePqgt8fHMwWmXMegNzA2u6gGH/+i83MC9iI8taYxGFPzAi9+v8YbzsnXBYTjQ1/CfQY5tVJUAo4rSMNFH6LBNR1P9M00gcBPMJwIabmZMTYBJns8lZeQA6r4m7/43UJZ9BTuBr2MCnily9zYGz2oBImW0dRtPxsn0V9gkNRwKohWOKlqtzoP2nTbtoUT/jyUNkGfhx3eMmQgAMnfU0BhxSHgYH2gFe/HXILfQpTp+cHsmSwcziyKAevNaG/r/L51ziRl1qSg7jzbrVHi7bdvvFu5qBsHtOorhblWwYrSQ==;
 5:j8KiufgRMHmZrfNf0GunHkn1qrpkSIxIAl4pDvrcPOfMgc3xH7YtyuplMLeEgbKsAIzYLmxqZykqXX6PFbCt7sTwYW0wMMkczCeCvBrFdI0BFsmSdhwaMsadc8Ff1ymSlreUiXAsF+scsvHY4f4VtvHoDTk+RPrv/q1kKSyV3r+CAdeN1xbPLeiz7nIo9XIrtRTh3hAFPow14L7I2zkrGw==;
 7:jKx69ZHXX76we+8GuTd/zcWpuFq4T8Y7AzaDTu18hup2QIUG0l3xINBqDgj8g9iL7D2+4YGTJTjPYl8/jemLdmfRAoo502Kick5GIfjX6TaGCogsZws+dCKGnXmoR65kfJsHEHcwqamaaomw6kDXZg==
x-ms-office365-filtering-correlation-id: ae7bf1b6-3513-446a-4fc6-08d670f57bd5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:DM5PR04MB0507; 
x-ms-traffictypediagnostic: DM5PR04MB0507:
x-microsoft-antispam-prvs: <DM5PR04MB050712414683DC5A9EFF8C7DF68C0@DM5PR04MB0507.namprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3002001)(3231475)(944501520)(52105112)(93006095)(93001095)(10201501046)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:DM5PR04MB0507; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0507; 
x-forefront-prvs: 0905A6B2C7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(396003)(346002)(376002)(39860400002)(199004)(189003)(256004)(14454004)(99286004)(6862004)(105586002)(7736002)(2906002)(53936002)(6436002)(97736004)(6486002)(6246003)(52116002)(498394004)(9686003)(478600001)(8936002)(6512007)(33896004)(98316002)(76176011)(5660300001)(61726006)(476003)(68736007)(43066004)(316002)(6116002)(26005)(305945005)(61266001)(3846002)(66066001)(81156014)(71190400001)(71200400001)(53546011)(186003)(229853002)(6506007)(4326008)(386003)(106356001)(446003)(55446002)(54906003)(81166006)(11346002)(102836004)(8676002)(25786009)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0507;
 H:DM5PR04MB0381.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /n5n+OmRBMCMYyaf4Gjy+gBYD+EuJAElSEjZzsns6hBp5DxhBshksJ5DXx8Dz6oZ4uyP8L0h/0xvI02crS2meW9RzYSMIxPoE5XxRzZZoNpyPxpZcUMat02EocJhKWvCXVO4fcpAAl/dnJXdRk1sDSqgKp//+2QxEFiwq+GTdbmzMgbbtQos1GzvYIRsEJNWe4IydIMcI5IMhyIuOCYvNMsGBU/tXJlNXX68SXveJOj1FvX/ayWTk1ER8GT06Wxu5xQ3Au0rFaWMA1YNq3x6KdeWNXSZ6Cw6PyQ8tk6lXZixhvybTrQKtUmDSwSHvTLa
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <0CE02293240FAC418326C4A661EE4C8C@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7bf1b6-3513-446a-4fc6-08d670f57bd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2019 21:01:36.9692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0507
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-02_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
 score=30
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901020184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190102_130144_799034_DAF6F2BD 
X-CRM114-Status: GOOD (  10.50  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: joe.hershberger@ni.com
Cc: u-boot <u-boot@lists.denx.de>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Joseph Hershberger <joseph.hershberger@ni.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Nov 9, 2018 at 8:21 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the compatible strings in the Synopsys DWMAC driver for :
> - The Amlogic GXBB (and other GX) SoC
> - The Amlogic AXG (and other GX) SoC
>
> Neil Armstrong (2):
>   net: designware: add meson meson gxbb comptatible
>   net: designware: add meson meson axg compatible

Hi Neil,

Trying to catch up on patches - I don't see this series in patchwork -
should it be?

Thanks,
-Joe
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
