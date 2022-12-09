Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DEDC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Dec 2022 00:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnRFVaWvjC9HG29QehT9EoZlA8ztNxvXevQFoeJepco=; b=ZPQGifSSQ9xUvj
	tQ6sf1d+z8TceVUSnxnaq12750hawE8wFU2mFLWRVo60JcPBaa9UMRpvPEySac0tA38ho7UH5SmdH
	31r8jYowTtL4s1p+09gGXL88ZiHu5UobDZBPYeHJ5R9wYB4v+G5LVYeegHPSQ1buuz2IREXOCaUWY
	5BDjiVB4RUevjZlqs0l2PvTJM/H8ozONugwVH5pj8v8MFCN4qMfMpZoUVW0B2ByzkUmorQcppkYmV
	NWyGtohdY40zn3c6axSiUFzImrFHnbVubuyTUF5NocQjkfpL7+Cuzxhq1cMXfObumWNq1vF4d2O0D
	fBkd1NnwG3w4aQQ/IKWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3RWC-00GvGh-4C; Fri, 09 Dec 2022 00:45:36 +0000
Received: from mail-tycjpn01olkn2057.outbound.protection.outlook.com ([40.92.99.57] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3RW9-00GvC6-Q9
	for linux-amlogic@lists.infradead.org; Fri, 09 Dec 2022 00:45:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8oR+BC0cvN1J4Zs74ZKHJmvMJoInhh7YnJWHZrpYVqluwVy6UeN85mfQdhBKusaugWD1cQnY3sA6vnDEb9kMy8hohkv7yhnl+4Cjalq5gDKPf6LSWPu/yXGOut4DCdIFv/zceExY/e46LYQefKorVt4yqX0TKHe29czyxXYaIIS2ZhC5gBNuRdzGMHDkRfDUpNX9x9jf4/ST4Ra2wYF0QpPdnFgfxpdiqtFns6EcVHTA1IXnusnXDxJUy5d365r3sx55HZSRHtukWCQiCNRnq0yjnezNHK/ud2GevfLRhpA23tr1YrGoHkOd3Y0whFymbnf/pyLcvXrQTZwhnPmIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYIUk0469vEYS3QRYkBTX5fsKY2NjmiZVbWVcWk4APg=;
 b=W3RjWays4rb4REoYD+AT8B/ykmnYDR8kHbR/XvbveuGFasEqdoaiDPt1jJ618VG4C9TKJbUu8vPPnzsXGPV8XP97lRgynsqfeHQuUAlzO3YFm5nTU0DI7RTO2Td7YiYfCTAW3QvmDJBmUxhmtSKkguy+WfbbrCZ/NJV5o2l+stTlhba8GuCUjF9je+YcCzfZE9ghEQKw6wk4+vc3gjlj8dpzBaompBjajf31rfW4poZGgqSmG1CHU3DipGp15TuWbnpM3ERRTt1M2exEaix1YP06tkaOjaoaplOsyyMuNmRiUs8wjC1gs3gJpLOrpby5QJhLf4jwcojWfgwK/2R9FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYIUk0469vEYS3QRYkBTX5fsKY2NjmiZVbWVcWk4APg=;
 b=lZfSr44nCOIl9iSyzZm6DZabpkKQAQzj0ScsC0DurBdwNkholQxY+aXdhVSjYuNoZ6E+dBOI7prhV86Jvth0EaEZgRUmKYuUlwucpA6h39XgTh+DLbSK7YH1zGHl0hcA2AzEtY19UYzHyFDNOur3npKKghEoYFD4Z+YyP3iNPUXvGN+8woCyrrjd7WzNVESS5x1ft7ka41BDZdOjomwR6DA+1hdI0hQK6LnEAYSc7ph0M13NU6Gzzc8LF3V4zgy9RevC326HPrS5GuJ6YdPMwNhXIFvI1NPmWpvm/er9TY75A7/a1Su4+4fLa8GJcRWms6CUVuwwPzt6JNr+61uszw==
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
 by OS3P286MB2680.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 00:45:26 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46%3]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 00:45:26 +0000
Date: Fri, 9 Dec 2022 08:45:20 +0800
From: Zhang Ning <zhangn1985@outlook.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	nick@khadas.com
Cc: linux-amlogic@lists.infradead.org
Subject: Re: VIM1's wifi doesn't work after update to Linux 6.1
Message-ID:  <OS0P286MB06415F3F763BEDC6870313A8CD1C9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
References: <OS0P286MB0641C7CE54DE2CFD928AD1ADCD1D9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
 <CAFBinCAa3C4KcOm8jLwcNGc_btUXUXUDGD+6yqVivxc+DDA5TQ@mail.gmail.com>
 <Y5KAxhvFzvoNYL2j@orangepipc>
Content-Disposition: inline
In-Reply-To: <Y5KAxhvFzvoNYL2j@orangepipc>
X-TMN: [SFt+b7VYsaBgVbcAplYBxV9Qy81fJAD8nfkS6H8KXRdOG2UBbKAhwjfXhTKDANk7]
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:cb::10)
X-Microsoft-Original-Message-ID: <Y5KFIA0yxvU+Kw2r@orangepipc>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS0P286MB0641:EE_|OS3P286MB2680:EE_
X-MS-Office365-Filtering-Correlation-Id: 468a9995-f2f8-401a-4e9c-08dad97ea9b4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pBhyuD1oplGQZK1ubyCreCKrBE9DC1xfN0g+mR7AwpT2VQNkRRpEYYF94B9CmPIt+hS2PoqRYfSiapbmHvqHCXzDOT1dHKVokTuVQyD2t4nF2QWbs1AQJuWb7bf2MfQJtuOrP3jWDR4PWBvX4n+wiTC86EG00sPwA4Sf8wtnemk1rq1FaX3mczAuvI6n1sK04GmtGqy4/LArCJmTW9KcL3JidrBMBt2Xsv7Ud9T1+lcFy/nzwcsQTnUdT5Hh17tEpFwJ9jZSYtKwSGlRI8u7EdFjck1a1PpQ5M31LE5bw9Jc7fAdU4X1qhVqDTlyg+4Xlbj+9jMxUUTki/fREZto190hHt5ynKmRP0DGYsCJMni/+T3ncNpWAA4/1yOjuhG46euxdluOfrzVbxhB8U9Hi5dKlbTDvhh0ePyaHTYc3NcpoGSWjlRTWFs3Ki5wvdHkqKchZlbxdlw8xKy7Xp9jJwSXfCL2BtUF3iGaFaDoE3LTTUMX1eJj5iZFVho7Off6LbtMEFSVlBCPnFLt0CBti+GXZL4DU99COqpIn4UFce1LExSSyun6aSzjDTRINVqeJenXiWleiY8bN1GTZ7SVA4RfBp/zaG+CrPwFE0P1Eviehyp9pQX8yr7amUOpMqbJiNpDXGhPo296vb6/mPab8w==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WXBCREE4eVVTY0ZheE15Rm5sTmhhWDVRdU1ZKytLSHB0YlRNSlhrKzNSU3hY?=
 =?utf-8?B?L2dIUUREcnBDY2RaUVBwMFlNMzZZMGdsOG96d00zdWV2aUFnbkhHL0tuMmRq?=
 =?utf-8?B?YStLUGNKeFJxblFFZFRPQUhaL2tnYlNZVGorYnB1SEEwTFVwZjkzd29lMWov?=
 =?utf-8?B?bW45TGp2Z0FSRkdkeHZMeFZlcERZTjV4aDJUUE9SekNSNGd4Y0F6SUluMmE0?=
 =?utf-8?B?QWExcmVtNkluMmo4WWZIZDlGQUFBbXhxYlZKQ2FXVWF1VUJXRUcvTDJ2Mzdn?=
 =?utf-8?B?eUZlY3BWa0hRWXpya2s3dk1LSmtQOG5GVTAwNTg1OUpwS1VUU2lWdVBtRXBP?=
 =?utf-8?B?RXdTN21ROHhmb3B3NVZZMTVybExlL0laamFrRWx2U2o0bGdtOGJvV1JpS1ox?=
 =?utf-8?B?ak9rYlZMK3RtN25VUmVySCtFU2NnZlBONWVZTkdkRVhkTUc4K2F2QVFxWWh1?=
 =?utf-8?B?T091RTIrZW5CUG50L1BNY0pBem1QMVBzbXl0dkpaNzlwTU02K0xFMGFqS1dn?=
 =?utf-8?B?dC82VjdEMmdHWkpJUmMrOEpvTUxOQ1ZJSnplV0VkWTFjRDhmMzNIR1UwZktl?=
 =?utf-8?B?NFNxekRONWJ6THM0WGNiNHc5aUhoS3JKaFhZNW02RGs1V1kzVVFVQVJuSlVO?=
 =?utf-8?B?dGVZM1Jvb1lUMVVPVWxtMTdDSGE1ZUZKcFM4U3UwMnlTZzRqS0VaVGNlMFBp?=
 =?utf-8?B?YmhFMzU4TG5UMmZ0OFpXOU5jRkpqbWcyWkNNbWdZS0g1ZnR5Y0J0ZFY3cmNj?=
 =?utf-8?B?T0lTQTZiVzFvNDFQS2dIaEIwYytvRThGQmxiUmNIZ2xKZzdHNHdZZHRSZDhZ?=
 =?utf-8?B?SFY3Vnhublk5dWlQWmZhdklvZUJsdHVPSVJ4R08rUVdhbzhaeXRQZk1abll1?=
 =?utf-8?B?eXdNUTVEcnBuRkUra2dOMUluMnlsWjI0Y2RGcnl6blZ4Ujl2S1ZsY3ZSQ0ZY?=
 =?utf-8?B?Q2dMWHEwTjFIbUpxditiVTlzTE51VEQvdEVreGVqSlR0M2hpVWJaTVpoT1RS?=
 =?utf-8?B?ek5iSndYd1JZa0N5cWZuY2R1VEptMnU5a0o5M2d5RFgxczk1c1A5M1hUdzRs?=
 =?utf-8?B?UkYzeko2d0x2dnF2VExtcGNzR2psUzlmQ1BCSFp5ejhhYlJNWVVqUEtXTEYx?=
 =?utf-8?B?dlN0ZDFMZVNjRFA3MW1pR1NId2xjOVZ3ZUIzODF6cFU5RDdndlpCZ3Z1YXcx?=
 =?utf-8?B?c2YvZCsxVFgyUEx0Q0xOWE9qd05MZzNPaUdqdm1vR0FGeSsrZ0RUakhLWi9V?=
 =?utf-8?B?UExvUC84V0tLeE1JemFsSzVuRU1FMkROOWR0S1dnTnZmZWEyL1VFbmVHT1Fl?=
 =?utf-8?B?bTlQYzFiWStvWDRQb05tdnF6UjNxQk90UXJoSFJneHplT1h1cUNYTzlvUUNB?=
 =?utf-8?B?WXlWRXc3WWpmbURETVcyZktwVTFNeC9iK0hDTVliZUZKWkE0bUY3WmxvVE5L?=
 =?utf-8?B?WDZqT2s0T3J4aWZTb2ppNUpkWTBYeXM0OVZ1akFrSTZmQ25lVzJmOGY0NkRx?=
 =?utf-8?B?UHBMaXBoTTVZbC9la1NxTmNMcksyeE5BOE5GVSsvVzUxZk1BMk9rS05FaU9m?=
 =?utf-8?B?bi85UkFBS0V6WlhIRHpJNDdudTZKWXNZOEhnQmtPakswNUVjRFRTNlpzTmVE?=
 =?utf-8?B?b3lHd1lqWGN0aXVaNStqUHVvZitMUjE4Q0cwR3ljd3YrQ1lWMnAzVVpCU0kz?=
 =?utf-8?B?K3VTY1MvR3hxb2s4ZWxuMFVWazJ0WFUyWkhVUDdxbzV2Qzl6aU1iZlFDR1l0?=
 =?utf-8?B?aHZtT3FzaXY0L2ZDbTVkUUtHR1RjL2xGVFRJMmZQejVCczZnQ1dDZlBNeUQ3?=
 =?utf-8?B?WURJTzJzdmNTaHB2dHRGZz09?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 468a9995-f2f8-401a-4e9c-08dad97ea9b4
X-MS-Exchange-CrossTenant-AuthSource: OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 00:45:26.4650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2680
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_164533_910333_36EF136E 
X-CRM114-Status: GOOD (  17.04  )
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

I find a issue in linux-wireless:
https://www.spinics.net/lists/linux-wireless/msg229742.html
same timeout, but it says brcm firmware crash.

but I don't see any firmware crash log, (I don't know whether crash log
would goto linux console)

@Nick, do you have time to try this issue in your side, and is it
possible to ask your supplier for newer firmware?

BR.
Ning.

On Fri, Dec 09, 2022 at 08:26:51AM +0800, Zhang Ning wrote:
> On Thu, Dec 08, 2022 at 10:40:26PM +0100, Martin Blumenstingl wrote:
> > Hello Ning,
> > 
> > On Thu, Dec 8, 2022 at 2:02 PM Zhang Ning <zhangn1985@outlook.com> wrote:
> > > After update khadas VIM1's kernel to 6.1-rc7, WIFI stop working, with
> > > below log:
> > [...]
> > That's unfortunate. Have you tried reverting commit 066ecde6d826b4
> > "mmc: meson-gx: add SDIO interrupt support"? I'm not saying that
> > reverting that patch is the correct way to fix this issue. It's one of
> > the few recent driver changes though, so at least it's a starting
> > point.
> > 
> > > I applied "WIP-arm64-dts-meson-set-p212-p23x-q20x-SDIO-to-100MH.patch"
> > > to VIM1's kernel 6.1.0-rc7, is it related?
> > Have you tried without that patch as well?
> 
> I have tried revert 066ecde6d826b4, and remove SDIO-to-100MH.patch,
> rebuild meson_gx_mmc and dtb, replace original, this issue still
> happens.
> 
> BR.
> Ning.
> > 
> > 
> > Best regards,
> > Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
