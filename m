Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D75DC77B73
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Apr 2023 20:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjHPeXswOoO59YjXd8tefg+0wUq7DWN/aIXZbFkE8Tc=; b=zHqdgdKe+KHa7A
	bkzMZV7XB0PDSiAxsI7CKG135QlwdEgplGeElrwaWhq2ZvTj+cT5o3VYzL+6HBksGIB7IorCB6rWB
	MeEfXJGuRKHToSJRybM2KKj9+E8dgxebT/wUuw2t2I1vDTcTEK/INnIw6qduvTAUiR/0AErIfg7gf
	nZq4AKwnxk/sAdyIRY8jsXPzpwoUAOvHoVqF5+yi5gjv3pRXHVB/1zjgWhqslNHHTSU5In7jZta/I
	0Nk2/GWAbydW+IUIxNdbdMocB/87v3r5hTvUSk4ugbuND4J7Tqx0Yil3ya74u6bZ1NPbQKiyNy1s0
	zFEwOpImtRhc2lH7BIIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1po8lZ-00EORd-1M;
	Sun, 16 Apr 2023 20:14:29 +0000
Received: from mo-csw1116-1.securemx.jp ([210.130.202.133] helo=mo-csw.securemx.jp)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1po8lU-00EOQw-2z;
	Sun, 16 Apr 2023 20:14:27 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 33GKCsu3024054; Mon, 17 Apr 2023 05:12:54 +0900
X-Iguazu-Qid: 2wHHFCEuz6IBojmDnU
X-Iguazu-QSIG: v=2; s=0; t=1681675973; q=2wHHFCEuz6IBojmDnU; m=tTSnWXhHtV9kCpSleMgE0kMLKoKq8vaG12bkcjuj8n0=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1110) id 33GKCck4037842
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 17 Apr 2023 05:12:41 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fblBl7QaFKPEYJsRa+w1Tb83Lltyhu/mLLiwdAeKXJzNIWZhw8Z2njn0kqWtN8gQqmzcWBAE4MemsPZTALmkDXggUqqdhEvRuYJulHK16rItvu6O+VU2nGqsYb5IerdN87L2b5waxmpMQLskYpGE9qRx3gQkgw8DJGWSYugWjx/8EY20gZEeLjKCmNekHBCNjuobA4ZV/bnmCAN2kHpEV5MDjC2z/WBdShZ98iA82QnI1yAtZ7USiHIk8j3ImGMve1Miu1egapWK/sxHYDrQ3pbPNWn/ABg1Sz4FZk4a8Ox41LAa7ffVliZq4Ne9pw3WtDVIHBjDNNVlidTKFN8kpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAoR7cBrKKiyN7RN+qFS16+6bqWB6IXIXSGC3Ti/0cQ=;
 b=hqVywAheNvB/Nui985Iv8d3wwm4ns/IVdJShgvEQ3c8EEpRDtiaRv6XMIyN/Acp3hi+dGrHFbJK+Usn3xcG7MY3rnnY4knQ2KGQ2KsQGvJuh6tujO07FzHVDmKkIV/DVqBe9MhZG468PzdyLqtT07PHEF2LT1migBziJ+P7lMmbSAtLruci9Pvra6onYRyZ+MHTKUMzQrcbUTo4A9iPFUEc+l/fB+pcm9TohJUbqawpCo1eGohIoB2rolCJjtzUWPkIyXyYRmhkB0EvPVr/31XuNf5J3Vb14BGLhksJ4OPSxE7WeOjUloW7ws0PrJxoabQj7k6N1GGI2CievUhUbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <nobuhiro1.iwamatsu@toshiba.co.jp>
To: <krzysztof.kozlowski@linaro.org>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <neil.armstrong@linaro.org>,
        <khilman@baylibre.com>, <jbrunet@baylibre.com>,
        <martin.blumenstingl@googlemail.com>, <jwerner@chromium.org>,
        <evanbenn@chromium.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
        <f.fainelli@gmail.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
        <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <sander@svanheule.net>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <fu.wei@linaro.org>, <vireshk@kernel.org>,
        <eugen.hristev@collabora.com>, <justinpopo6@gmail.com>,
        <rafal@milecki.pl>, <linus.walleij@linaro.org>, <clabbe@baylibre.com>,
        <Anson.Huang@nxp.com>, <robert.marko@sartura.hr>,
        <sergio.paracuellos@gmail.com>, <quic_saipraka@quicinc.com>,
        <wsa+renesas@sang-engineering.com>, <jamie@jamieiles.com>,
        <yannick.fertre@foss.st.com>, <christophe.roullier@foss.st.com>,
        <shubhrajyoti.datta@xilinx.com>, <srinivas.neeli@xilinx.com>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 5/6] dt-bindings: watchdog: toshiba,visconti-wdt: simplify
 with unevaluatedProperties
Thread-Topic: [PATCH 5/6] dt-bindings: watchdog: toshiba,visconti-wdt:
 simplify with unevaluatedProperties
Thread-Index: AQHZb4DW/nyKteRfzE6TT61PALyrca8uYDxw
Date: Sun, 16 Apr 2023 20:12:32 +0000
X-TSB-HOP2: ON
Message-ID: <TYWPR01MB9420BB1F19C8EE8B87F92542929F9@TYWPR01MB9420.jpnprd01.prod.outlook.com>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230415095112.51257-5-krzysztof.kozlowski@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB9420:EE_|TY3PR01MB11007:EE_
x-ms-office365-filtering-correlation-id: af03b371-85d2-459d-0d57-08db3eb6e995
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wj0duY5uKC7QEELuIhqkWrJDP3vfEEkePcP89hYSDST1L5F8vyh2oC32D69iu9xtu0zZyKPHJ25P8Vlw8snivMC6HgBqmgI/HT/JTfFOYeRX8uMYvObsaW4wewddEmsmL1soJEfovlQ9mZI2Ls0kv93UKacgD7jkVhctZraXrSRLqqyvZyPk3EpNuY6/8OE6ABvcQvaLC7IQfupkA06jvlJ6X/FUX5itX11Oaa4fuNDanQzAFoTx+/Nvzwr7hp8ZUj5a3ZeMu9U7GGP8WN/ZecSerEY6PcFFUmwtsewrk+a+4tNBVeZSSggR3vZGfRilPU88AF1Tt9JrMHS4jkLsBzDyvPWPt1cXuRolQffMMzRBQIBL6QQ1gmqNc3DyK+4GzmwTAT6kWHsZOAnEjnwYn5RLRzDaNF4Y6HnugXJw+uLE+ClFMFQXq4akT832w/iRwuLdzL2DzUJ3J8wgKnA5spYqVpu1FtNBu+2z9yi42KgIR+RFRUG+AC/oOh3UskRaXexamMZUSBNQSQeqNn86a8tz+pjNoHuzciNjCQMNZBeaub7demZv5tFgVFkd2qNb5BjhQnHuuBYCldkrVXt2DKvkFU2tztJl1iUCeNMPJpB4SYozgvdjqukB4gV7p4Q+eWEpqIBQrR+a1O/dXKqqQA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB9420.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(7366002)(7406005)(7416002)(5660300002)(52536014)(86362001)(83380400001)(186003)(26005)(6506007)(9686003)(1191002)(921005)(122000001)(38100700002)(38070700005)(8936002)(8676002)(33656002)(478600001)(110136005)(71200400001)(7696005)(55016003)(41300700001)(316002)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(2906002)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlY2T25ucU5Kd0lKQVp0M2U5MlpGeXhWMG1Jamd1Q3Y0bTFaNGRJeHd2MXdn?=
 =?utf-8?B?SDdPdGE0QWhLYnp6bEw4REFXK2lNUmU5MzVCaHJrWm92NUlPaWF5ZWZReTV6?=
 =?utf-8?B?TXlhSFh5UGV1bFQwRlV4TDRpSCtqSWJvTXpnUlk2YmlKcHkyYnNTcUl6TmtI?=
 =?utf-8?B?ZVVIK0xSYXRtbXBuNE5ubWs1eUQ4cVE0dC8vU2dYSU10TGEvdmZIR3U1U0pY?=
 =?utf-8?B?VG5RZlEyZkpJaUJBc0ZNK0UxSlAxZ0ZjcDdua09iaFBzeHlkbTBaczAvV09M?=
 =?utf-8?B?Vy9GQjRQOWhiYTVMbW1lSVN0SkVzNkdYeDJPQ1diRHR1cDhublJiZmhCbjd2?=
 =?utf-8?B?aHQvRUw4ZmNyYXlvQXJhaGsxendoNjNqVmdjdVQvbHdTTmwrRGhzU3dTbnp6?=
 =?utf-8?B?dEZMQjlOOHVZcG9ibG52c1VRaEUraW1zd0x2Vnp6Y1RvSnFKZHAya3k0NWNz?=
 =?utf-8?B?Tytyd21BL1h0N3ZhVnNESnhGdkJPSjRLcyszYnloYTRjaTZuLzczaE9qaDAy?=
 =?utf-8?B?WkhSVWlDbm5sUEp0LzRJeTJxeGUzVmdkNTZVbjFYVUo5VFhTTjQ5SG9XeWEy?=
 =?utf-8?B?TkE3U0R2UjhMUHJKTitSdDNmc1FQY2lvN3psQVphTGZ3bnFHT3Bkdk5FcmZh?=
 =?utf-8?B?NmFSS2dYaEt4bEE0bGphK2hKVEdPMXFGVEJYcDBoSUZWd2R6cm1zaDA4Z3lC?=
 =?utf-8?B?OTF0MVdIR0lYOGRST0hCRW54RjFZZ3FUWUF6NCttckFINS9Fa01SREdBVys0?=
 =?utf-8?B?bDFhODhrWjdpUjZvT1lBem5LWFhKTkptdGpZc1FXTlhJc2MwdUExLzJzVENO?=
 =?utf-8?B?bitaNzl3Ylp3TndJVlMzSTZTeUVCWXZrOWlCVlk5cmdpWDk0VTZXVkF4ajJk?=
 =?utf-8?B?UTdVR3ZGaFoxNGFNdVhGSUhLM29IWVRZUE9kZ2lwdlMyZVBzTmU4R3JXYVZh?=
 =?utf-8?B?dzB3QktnTmZVTFhGbWFGanFUaDdieUl5b25WcUpqYjhSMWQvRWx1blFyd25R?=
 =?utf-8?B?OWZrRGw0U0VCKzdUOHNZdXloYnI4VVZDRHZjMHpaVFdIUnIweEJkUkhuV2tM?=
 =?utf-8?B?NGJNcStSbVFFQ0lQcVRHb05VL3Y2UFROMysxNXNKeEptUFpmQzc5TVFtb3pJ?=
 =?utf-8?B?VmVRVkF0anQ4MVYwRFpjdVdCZXNFVVprVXk4dFFWUkJYYXAxOU1YZmZORllL?=
 =?utf-8?B?R1ZkODhvNEdFaHlIc2cyQU95K0RnS1k5a1h4aGlWUHJJVHR2OXVXMjAvWitP?=
 =?utf-8?B?NlJ1OENqb2V5YThXb0Q1M0NnZkExamdaWGhTdVQyQ2JVMHBGdjdvY1MxZXpC?=
 =?utf-8?B?ZGkwbUI0NElMRzF4amlRNFpNWm9lMkFFYVIwSTVqMERSL216VkpERjhuNlpp?=
 =?utf-8?B?VVlUUjVOQ1RtbTl5SHpuVnV0ZGY5TldWWTEwdmlKRk1PVlFKSXNZTzVjeEQv?=
 =?utf-8?B?MWRTaFcrM3pqR05sYlVKUXVQeDkwbnVkd2VVUEw1L05oSDJxV1R4ZjhHRmtO?=
 =?utf-8?B?eko4RWgzR1BSSDZEK0VFeG52eFhCdDI4WmlZMTFnV21Qb3JjR01LL0FFckgr?=
 =?utf-8?B?a3FkY21aWHJjc1dFQVpNNmhHU1BWUHg0Zmo5ME5iRW1yeGRZRmpJOU4wdzl6?=
 =?utf-8?B?bnZ6Nzh5NjJ1S0JGbzdNMXZxNjBqL1VyamRGcnRFdXR5TGNLSmpGaG5JWnBG?=
 =?utf-8?B?WW9nWjRjbjg1dmdUc2ExdXJIcFRrVTI0UTlBd09Cdk9sSU41WTU1Yllxd05Y?=
 =?utf-8?B?aGUwTGkvRjA0MGcxV0laY1h2V0RZVEEyRzZ0YzgvV1hRcGQvSEVCT2hReTF4?=
 =?utf-8?B?b2UzN1NpSElKZkdhYjcrSFJoUlYyVkZtSlMvS1QwVy9acVdmbnBRWklWMkN1?=
 =?utf-8?B?ZHQ5QnoxbFRQVnVIaWZBbTJIT3htcVdGOWZiNk51YmVOT2NhQzhJRytuNHRQ?=
 =?utf-8?B?MW1GdE5PWGdSdFMwc082ZUM2bDFOendwSVlyNVZNcTZaZTZiWDRWTW9RY0s3?=
 =?utf-8?B?M3N3ZDZyZitwUW80dFZERDZTa3M5dTVhdDZ1NkpVYmMxV3M0bTlYT3J6a2Vm?=
 =?utf-8?B?RGJ0QnZKb1JlbnlsNnFLc3htQ3FhWVNLeVAvZ0pMU1JrcWJxT3pNa1A5N3ZW?=
 =?utf-8?B?dGxwOXRuMTVRZXVQQmlpbzdOVjZZR0FSMEFxSDljUmRkd3Y5VWJSaU5Qd3pM?=
 =?utf-8?B?aHc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB9420.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af03b371-85d2-459d-0d57-08db3eb6e995
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2023 20:12:32.6613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1sriqPVzycidn3s/dBSgKiYHj2knZC4QPk9TCbds6ihWkxeKG9JyULsJVH6PWl2ZENs1o8ZQY6+Ha04XKHJnfDD1d/+qYc5jvb2tO2cSalNQF2IjNDXoBrbXk/vOgo7E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11007
X-OriginatorOrg: toshiba.co.jp
MSSCP.TransferMailToMossAgent: 103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_131425_243642_9227AF78 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

> Subject: [PATCH 5/6] dt-bindings: watchdog: toshiba,visconti-wdt: simplify
> with unevaluatedProperties
> 
> Allow generic watchdog properties by using unevaluatedProperties: false.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml    | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Acked-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

Best regards,
  Nobuhiro

> 
> diff --git
> a/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
> b/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
> index eba083822d1f..51d03d5b08ad 100644
> ---
> a/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
> +++
> b/Documentation/devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml
> @@ -24,14 +24,12 @@ properties:
>    clocks:
>      maxItems: 1
> 
> -  timeout-sec: true
> -
>  required:
>    - compatible
>    - reg
>    - clocks
> 
> -additionalProperties: false
> +unevaluatedProperties: false
> 
>  examples:
>    - |
> --
> 2.34.1
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
