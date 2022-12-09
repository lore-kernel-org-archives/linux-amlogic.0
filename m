Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E5EC001B2
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Dec 2022 00:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jueCV60eYeu26ihb+qKsK5TrxHtmrD7K/bYV5D4ZT9k=; b=gVyFiwxZilA5E2
	+GBgsPWkFY2L+GmXXndLTZPzZUzOOl75VD6PRGyXg0xS7vzP+MD04fBrzU8PtXL0v/6y+o3xikwgG
	wSuFvBZrBw+/KiGF3pND21VpYuFoDW7EL0fy04bKtLzZUkW/AVes4s7Ja33UvxXnVncELsaR729Yo
	v0ab7XKjylZ/KCOCFMfOO6/1dN9+8Bla1EZuOssgCA5nrHckbeJPw7XKhvaq6gfOxUDYocIKfD1Wn
	EDRhuGx6i/xStSgId/05dpLT7lcK9hvqPU2jYr/+KAi5u+3hGbDg/Zpe2TQljZHt+/jgMoQChFKpP
	qQQCYy7XgKhj6zQ+LxVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3REA-00GQJP-1P; Fri, 09 Dec 2022 00:26:58 +0000
Received: from mail-os0jpn01olkn2060.outbound.protection.outlook.com ([40.92.98.60] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3RE7-00GQG8-Bv
	for linux-amlogic@lists.infradead.org; Fri, 09 Dec 2022 00:26:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aa4SlzFTjngdGXKr4z0EK7axI8pC068hHjm4dI95bXk5Ut5LnWQTuZdCNDYJMJIIppFqnZ5YfLBwCmwkNBbV387TRTsnb2TvYAU1CwbgDhiCVqD3C1BdXixRT3hk9To9EbBrrtE8oHaOGFvrWIWb64ZILyTU2LForBn9OaC/zkC/WcnCSjtx3e6yHLosgVTpSqIdfE5+PpDeIQyYcMITkCoyGmzvTYhim30ZCsqaSdWiTVM8owLadyFZLb7VKw4B+a0ARUB0DzTngx4mEMxu1ic9755VKT6M3nYcDyxiuKmc6N7U0xuSeFqpD2ID3XOiC7t3Q8hkGoo/Iub56i7sTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xhSXLNXRiRLIPcDi+KwimlATpWPAEv+NHKTd7Sdxv8=;
 b=WyOh6OmiR+ybSbP9DAYuiYBzgHlQuTgnEB/pR/Bnfcitne5W61T+SmjcQRR7PwJ1j9RUfUPbRygDVa5DbMy69SDDn7I0rMlsGqtzRV2r5+3yexZuBUb8mBLN1iDGIduo78R6lROQT2JXEqHWB4l4n/CMg7Vc8gVzh3J5yM32isJcfmgFWIIUs1Y6gtfAVSBuVgHD5aojtRtUa6m+ATOCeCuyousY3oSyN9LihftL02wMMji9AvXzT8lwSQ0mcHO93THMQSRkP/t7Qd4go7QbSUMx+NbLgEUCZTOrC/ZTwAvfOtsc0v6IO2H1b5xRndrvOGygupeG7dhfu0HzTbkF5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xhSXLNXRiRLIPcDi+KwimlATpWPAEv+NHKTd7Sdxv8=;
 b=iLp5NIJqUzMR4P0ZOL2e4uJ54+dqEmg3XRcm31Prdue3w3eqyMw65LOCdwnMhNeOeqDwOKCzkhUVVsrz9TDC8My2XSWserUrdO2UYvIlofmUfFFCQ+7AnZo17CvyypcU+6ECRUcETHHxpbcfhybT+kb1Tu7tRqUr74yztPRL6sKKGYd/EtaBJ3UVs/5a+nFbOO16baQjds2q6UFM9ErirXJC5KGJOW5cTogLeEnYvEemDi2jZT/LV701ejmxtkG6Po4XkitAv3BoDSehLQi5H2P+N5av1Pd998QFkintbpjvjRxdTuH/RdFrMXHJlx5Y3JWoRzHlcUwkU6i9rRSeeQ==
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:cb::10)
 by TY3P286MB2689.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:254::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Fri, 9 Dec
 2022 00:26:51 +0000
Received: from OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46]) by OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 ([fe80::4b3c:7c0f:6f27:5d46%3]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 00:26:51 +0000
Date: Fri, 9 Dec 2022 08:26:46 +0800
From: Zhang Ning <zhangn1985@outlook.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org
Subject: Re: VIM1's wifi doesn't work after update to Linux 6.1
Message-ID:  <OS0P286MB064194AD6CC5D88C4D7ABFC0CD1C9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
References: <OS0P286MB0641C7CE54DE2CFD928AD1ADCD1D9@OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM>
 <CAFBinCAa3C4KcOm8jLwcNGc_btUXUXUDGD+6yqVivxc+DDA5TQ@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAFBinCAa3C4KcOm8jLwcNGc_btUXUXUDGD+6yqVivxc+DDA5TQ@mail.gmail.com>
X-TMN: [j2m9vSaBa8YEZ/O/cDmtkhsKpcx+deLdfWbXABXVgs4rUY6ldpqnQAvpwaiOBVb+]
X-ClientProxiedBy: SG2PR06CA0244.apcprd06.prod.outlook.com
 (2603:1096:4:ac::28) To OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:cb::10)
X-Microsoft-Original-Message-ID: <Y5KAxhvFzvoNYL2j@orangepipc>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS0P286MB0641:EE_|TY3P286MB2689:EE_
X-MS-Office365-Filtering-Correlation-Id: b580f58d-67a5-44d5-a9b1-08dad97c10f9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	RFYl7oyyHolsx1gXmx1/9TdhbKd7wpArgvZKVD0hG7pIcLnQY2gAyK+IeU4IRu/IHZU7n/jx8UvIIFP1KZ7zRG3eNXtlxuRrplXP2Om0Iw/hTcY8WWjC6bRGDBMhPr2PSIeMnYytngO2xK0Dt3yL6fFF6ITbqoNtp7fftmlKMeGVxx/ZpmUA5OCWxLTGAm1KlxbHqLNH7+Gg16QEfqoUP0Punts5B3J/dBpyYygrs+NPOQib4AXWmqNaBNk0REwW53aDfufBoy4bLt/2Eoas1jWcM8uyzsRouBUH+As8VSkLjf4ld6gWTi2DTgStBfIPX/wp47TdwFUfFtAFNypvrvzEAZv79mltAJvkK4q5btQb07L8IF9YNHmPYTlyQUTm7ILVVrw2+qL85ECjBqava/Nko06WBmmBVf1M+LuEHUKcZvYN/ff8aTLuhHvEzKOzolsaVk/U58wnaBkLgU8lb0Q8qGiYSVKG0jsMV8NiGteMtlSAzYIwHE16OSYbMp79uH9Mh9GCEm+iHOGPogAeHmGUauoqgVqKjxTtJev/KMDLN8rh6AHcu7kv8bJS6W8WzQbX0Lhxpauv2G9DVy2oQB12xtB4bMR1vZbFJRh/Gy6blBJiTh8LG4krb9kLoTASNLAFofEgrAGeNvTREX7uVw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MnBBcHg0RDJ2Tmc4QUNHTEg5Y1hBTE5STEw4cE4xN3VMOG9WOUdFaUt5Mjc1?=
 =?utf-8?B?UnBUOEdWdWNrNU40c3FDcWx0VWQ5cENsMVlmVGJYdE5MRlM1bHRuVWNNRDd5?=
 =?utf-8?B?UFUzYi8xSGorZjRnS001c1FzaTllaEFQTWJFSCtBV0ZYck4yYUZiek9XRGhi?=
 =?utf-8?B?WUl0MW9LbFl1enVlNFc0QUI2aEN6QmlhNitraGZwNlU2YndVYUdqK1hPZWhu?=
 =?utf-8?B?L3hGTll6cjhzeFM3YkluWUhMM3FVSHNZRGl1em9Eb0N3djc1bE4vcmdzRGRC?=
 =?utf-8?B?cEJVV1AxcFNWLzV1UENkWXFUVi9uN2g2Q05wY3NsQXRZOTJRVy9wM1UrNk9E?=
 =?utf-8?B?Qk1qMDYyaitTczJ4cW5EYm5LUjJQVmtTMlVPbGNPYm9qUnRjb2YrOGZVM0lV?=
 =?utf-8?B?QjJmV1FINHNiUkJDcDZDVXYwZXcyc1gydjlUbVNUaEozQWZSZlMxSnJoSEJn?=
 =?utf-8?B?ZGc1K0cxUG5FOVExSElmKzdzOXlVRmd1QTYrbUw0U0IxQW9aN0NCb1pMbXdh?=
 =?utf-8?B?MyswazA1TlBXZGFwK2d5dDVTMG1ENkx4ZFdwelVKN0dLSzUwSEkwTi9lOE44?=
 =?utf-8?B?RzEvZVFyMjUzRHc4R2NLYi9wVU1Rd25nTHRweE9URzZYT01YdU4zTlJkRkZE?=
 =?utf-8?B?YllKRm5vZDVNejN2T0hVeWh4R3lyNzF4SU1lTGtSRTNwek9ISGFkU0tObkJh?=
 =?utf-8?B?NWFkTktkbVMwRC9KRzBCako5MW9yYWpBbWwrcFhNSkxoN2M4L2VkdkZPcjkr?=
 =?utf-8?B?ZHZkaEJjUURvMzM3T2dPa1BrZS8wUGM2MDBrSVc4cXM1cUJqLzB0dVNPWHZp?=
 =?utf-8?B?RmNXMkllYnk4bytiVU1VT0lQREdmRGhCK1A5QTlhT0pnY3VONE02RnVSTkVH?=
 =?utf-8?B?OGhFOWZKSUF0SmZhbWp5YUhrZ2srUmxBSkN0RVJGYkhxRElvU0dIa3NRazhO?=
 =?utf-8?B?c0xQR05yL0lyT0xmZHc5VkJyN2tVSUIzRi9CQ2NLbzVYakZKUGdETDlyR1Q1?=
 =?utf-8?B?Uk1OY2JYSHAzTHRNVG9ya1ZrVjF0QjFaejRxenFISTNLbHJVY3hkVHFrVnpv?=
 =?utf-8?B?VjBXRkVPSHlmK09LMG1LTjJ1cjFKaytXMzVKeEYwaWpkakhGa3ZQakJBNENy?=
 =?utf-8?B?QVFDUTUzQWZveWZEYzY4N0ZtV1ZHQURxcHZiYXhvN09CL21sbWI4VGd1cGFz?=
 =?utf-8?B?SVdFRFY3YlA4RzZuKzViRmlzdVltVTlJbXkzbCtjNU9qYWEwekZGVC9pdmZk?=
 =?utf-8?B?WkV6RTc2THVjSWhrWDd0Qy9zR1RROXFuV1BmWUJ6K1dTelRQc256eFRRamdv?=
 =?utf-8?B?TlZtSFY5Kzk4MWFlNXZURUZHVGFBelNBSTg3Q2ZEbnBwZWw3ZjFLL3Y0akY1?=
 =?utf-8?B?cU5jTlI5TUdqVjI5eVVhRkJjRDVPcVV1VFArYVJ1eExpYjE4bndZWWdCTURa?=
 =?utf-8?B?NE9NQlJubnh6R3BYVnh1N3ZmU2pJOU5ITE5uZEZtUXZhNFRMMmR3SlFDb3VK?=
 =?utf-8?B?Wkd4Ym4zdGNiN0hpZ2I1ODlNclZFbnBCWWJ1Mkh1bmgzNEViRVcyajJuY09k?=
 =?utf-8?B?dzFjbzlrN0V3NXVRdkxJRXdiRU5MT2NoazZNb083anFTZkRHaktSSnZBRmUr?=
 =?utf-8?B?RkU1MmJaRno3VEtMLzVlb1p3WDdKV3NUczZWblZUZTY2aXRKaWFhTmhkUHZR?=
 =?utf-8?B?VjJHMlExOURmekZQTkpJOVFTQ0ozcmpZWitKek9lLzBiUWducXpPd2dkSnRM?=
 =?utf-8?B?bGhNcnE2NnAxSjNaSlByV0NLVVA1cDFkNWNnMTlRNEhtSUFIYjlnQUhUUDl1?=
 =?utf-8?B?Q1NJNFpXSXB1TVhYRzFEdz09?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b580f58d-67a5-44d5-a9b1-08dad97c10f9
X-MS-Exchange-CrossTenant-AuthSource: OS0P286MB0641.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 00:26:51.3127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB2689
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_162655_437350_C5051C6F 
X-CRM114-Status: GOOD (  11.72  )
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

On Thu, Dec 08, 2022 at 10:40:26PM +0100, Martin Blumenstingl wrote:
> Hello Ning,
> 
> On Thu, Dec 8, 2022 at 2:02 PM Zhang Ning <zhangn1985@outlook.com> wrote:
> > After update khadas VIM1's kernel to 6.1-rc7, WIFI stop working, with
> > below log:
> [...]
> That's unfortunate. Have you tried reverting commit 066ecde6d826b4
> "mmc: meson-gx: add SDIO interrupt support"? I'm not saying that
> reverting that patch is the correct way to fix this issue. It's one of
> the few recent driver changes though, so at least it's a starting
> point.
> 
> > I applied "WIP-arm64-dts-meson-set-p212-p23x-q20x-SDIO-to-100MH.patch"
> > to VIM1's kernel 6.1.0-rc7, is it related?
> Have you tried without that patch as well?

I have tried revert 066ecde6d826b4, and remove SDIO-to-100MH.patch,
rebuild meson_gx_mmc and dtb, replace original, this issue still
happens.

BR.
Ning.
> 
> 
> Best regards,
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
