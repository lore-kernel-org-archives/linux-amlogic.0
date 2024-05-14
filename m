Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECDBC04FFE
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2024 23:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fJ6EdpaktE4Focr2q4tNhuIobuy9gXSNSDP7RuO2uHM=; b=Ai4BWRgkbBikrAjV++E2Xh5e/q
	42zCNsviNjjQ3CaG9qMvP6TGY0ZqK8zPK/sVmOBpl/5V6jfNdSToTBqhtVoh81qNc1B27G31N+J4/
	kAMgxvmCYnve/4Z4I3IbNk9vHFfdPYjjAn+BfT6bMOQOgqn45pZJMLgbpBQY2rSk7u7E7sy4nPhd9
	c/2XQTOC7E02QkoCFXkFvcPXq3m79Znde2AuSmXpV98qGMIvm8ByS9DKWH9j+ldHrQANL3O71IVMM
	7mV+5nTFwvkB0PvHGZ6zawwtGroohWOtYPDAa4bzOsTT50xqiMqyLXrMm0Q7r0l5Y9nAn29kOS+pD
	JcIVmjww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s71Ij-0000000HR3x-3crA;
	Tue, 14 May 2024 23:11:17 +0000
Received: from mail-tycjpn01on20600.outbound.protection.outlook.com ([2a01:111:f403:2019::600] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s71If-0000000HR30-2nfe
	for linux-amlogic@lists.infradead.org;
	Tue, 14 May 2024 23:11:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7CQruq5610dPBN25IxE30zfaU9BBeNhtOhYhbG0da1skjSSGLev7ZCYFvHAMowgQ0PlNpEgmI5pgyaE7n7pIYQ2UMAltvYa4KK/XV0u4z8362T/8QuBZFQFJ3Rye8nFtZhlhMz0/5gWyCVQLDxYe3YFo7/snk+fct5nsiY2i3FsBcf+PAMahZ3CG2FsJxf90zEoLJpZ1gmKZAHwRiY2GGPRuKi+SB0IJzSt3kYpP7kk7bc0SJUSEgkeoSAvOVNidiuiA/7wpzW7jY+/G6w6uBGdO8pBSs/qOw1Wd0okgZ0zNi0+Sufyc4Sjs/xl+VNL/bSZDF3aBo+oBodA0O3K7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2rhKTCvZy8XOEwxWVQYAXX4+dfQhNpDi2j8be0oGdY=;
 b=eh+Xm/eKBPAXoCFsOE5pKEhWDNWwwFssdly4r7XVyp+V6VS6mX7zwDVKV1GJtBctIM9GdE7Z1I6pTH+eoBU5Jcxf3bHmq/8r7T5rz+c9aRgkfhGliq6nfKORcNhXYnyw0n4jzr51aNo1h7EbfQ540pjzcQ/WLBY7BXGLzXP4xvrnC630sprc8DPhjanfgDPsQhxv8SGljzFh6eT36ngFHiz4JdAdmg9LxUIU0UvD0UmUhhrVPOBLmdgKDPhxUIIzzoUEcTfJ22TUyuYn/ul0d5g6js+jRfMzyNwxQCogQODTcO2LZFwIKgguWewoeNTF6Kma+r9IVYWSP49uHUV8AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2rhKTCvZy8XOEwxWVQYAXX4+dfQhNpDi2j8be0oGdY=;
 b=oOOapsaRFv37wIimu3knl4HfjNoDrkr1Qyg9rA8u/rmpOCjw2AflwrL6R5xnl9KknPy6zTSZJ3x5gorX+FhPpyubuAv5XB+JBB1DwLUqJcDwm0z8aDSa1ucJl/gOxMlx/tWM0pwR0WReYUnm3J54snv9gADx7qnPRZ2+DvpBJ/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB7024.jpnprd01.prod.outlook.com
 (2603:1096:400:dc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Tue, 14 May
 2024 23:11:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7587.025; Tue, 14 May 2024
 23:11:03 +0000
Message-ID: <87seyk2dmh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RFC] ASoC: amlogic: do not use dpcm_playback/capture flags
In-Reply-To: <46daae9b-10dc-4f49-8a25-c387d03ae87a@sirena.org.uk>
References: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
	<20240514143116.3824376-1-jbrunet@baylibre.com>
	<46daae9b-10dc-4f49-8a25-c387d03ae87a@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Date: Tue, 14 May 2024 23:11:03 +0000
X-ClientProxiedBy: TYBP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: 952dffdb-697e-463e-7b65-08dc746b2043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mPPiogtXsPWynbzhBLzqe/fyCFTXuWluXTfJKtjKCqKY8KMMdGEkMS1MzeNa?=
 =?us-ascii?Q?cKbS9D+XIxe7APhJSZKj3pxpjmSaxiDp7mIxUlYUs7fDbbvbKm0LqRuvGDvM?=
 =?us-ascii?Q?NtgLOWqDagDKKYLkoW184SzsKAwf9deskLhOvIMlqXunfZW5HquofvM6KlOv?=
 =?us-ascii?Q?bo5MxLlUZA+UXu1z7AEuE0fHD0lTpoqNiRXH7rjvuA6FY6m+LwUUa7FbH9aw?=
 =?us-ascii?Q?pBrbultw82ZPWZ1CyaHkemoW2LhXT7kmBgiBvYe/6TAgYdAMnSPMdai/yazJ?=
 =?us-ascii?Q?ws5Hym7e26MwSKtCd2uf77F84MoRR4tXY/cknB6RagUEj4ExZgM1eyPUpmry?=
 =?us-ascii?Q?bNkRtPxbG0IEWP+BgP2qZ9xzFG3jrT6IvMncCQgoqmVDVFk4cNk6sHtMIWWl?=
 =?us-ascii?Q?3bXW+VKnL696DdQMvCYabDR5ThOzdx0mAcS+8JHbzx5dz+orgEGAs0TfAyx5?=
 =?us-ascii?Q?gLt9dQAlp4gdb0bu5a0n4joAOQtUteokwiHoTRqejo2VnmVu6u4p/EbIVXKF?=
 =?us-ascii?Q?hWAX2xTpRmun0Ib5pY2HbLoRfXYa2sDdECUr4jtOeu83eYpYiKchO9mKQdYz?=
 =?us-ascii?Q?j08liyVcyxxtI1svtW8e7znTW8Vf3sbfyxKXrkdjbYxdiXjm7CMN+cBqzT//?=
 =?us-ascii?Q?SaGmAvOaEA+mQ0CvsWbr46qXbva42dycaJnIAu+ZklDL3DRLazrMiWioHeDn?=
 =?us-ascii?Q?deEhi2lMrzi4sugm+uB1SFDzqa1gZSP9vdjBWuXlTwMhwiaeubMAJjXvjnBz?=
 =?us-ascii?Q?ePsAou2MvJLyGv012+NIc8E6Z6Ql5Np/KeTGc339zBukUzlVcFbESu9WnB50?=
 =?us-ascii?Q?CFs9zR85NaRwCQSDQp2DZxddUVYKed6e8TciIVqOyyztCnJCDpKVRLlCxiNO?=
 =?us-ascii?Q?6gpgdSGiNymiYsqDAd5B7R5tiwGt1Woimn8voiQ4nkLQJ4E3p51NqhqySVyL?=
 =?us-ascii?Q?fMN/oKt346mUPouseG1+ZaNOP9o6rfWilgSudeTc8nqgTeFWD6GDncLd+dXX?=
 =?us-ascii?Q?J8fYXHNyY507j+FOZ1XEN7tXK0roBXTFv0cBTdWaqFo9HyDor9AkedlLQaTb?=
 =?us-ascii?Q?ti5jAfJ/2D58MvjawGtYupq/+w00A3oZW6k+OV2B22E3KfjLaFQyVAJHLL5S?=
 =?us-ascii?Q?G9q37dDE9xNgBRfLi56CQzDh1IWXhlhWdqKuCF6/ve64nqr+DOygl5TKDkQT?=
 =?us-ascii?Q?Na6+g2U3RFcEPyZPREmA0iYkpY4XttFYAr2D33DFe9D01Tpl04+2jQRF7fxn?=
 =?us-ascii?Q?ZxQGZFjT4gc/XbnXc4EAQE+IZHt3fkcHJYA+6VD98EfPmmdqFHk7jKxumUsY?=
 =?us-ascii?Q?+MZBRzdU0qISS/F5OVjFSMuj6ZwxjhpK4sziNQsTGzpq6g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eAkVOj3jLv8VZfNn7i4vSYxU0OIZSJ8mg08aMHBNkEe8LxsyNuHwqsvRcdko?=
 =?us-ascii?Q?xApnNGyunsqsBujezydXF5ppAD4J7PQdFBvYzeRNX+kOxH80yBPPb93OIFTH?=
 =?us-ascii?Q?XV0JUHPTKcEk/tBWXRbUG+fBJBO3kfBvnimo87nxqBokaCe4K1SxxGwlOLvl?=
 =?us-ascii?Q?xyJHvkTuIxwMAPNjhQAWaH/x8r4GsIscVHW0xZMV5W/LcmvuEdlKeG/Mmtu5?=
 =?us-ascii?Q?o2TNrQ95/q54FHMhmU7M+ToR/pqaX/DYLGDnD81yuTnS0RCblrBv8OiiakhC?=
 =?us-ascii?Q?NjtvHpOppU3r/oi4tcZasXNYBB2CKsW1kFNX6ohLsG3ACuWk9uvB27+/IZBR?=
 =?us-ascii?Q?WO0eC2Oqu5e81UH2rAT8yi5Vgxm1sYXFxiksB37kp3MSIUr6zGwF7Zqbcr8x?=
 =?us-ascii?Q?78TvfeDqBBwyrxX/yArdxDFplZOBEBZlOpUU21dhMtflRKg9N0vJ6k2JtX8E?=
 =?us-ascii?Q?xwpBWY4/UanVVxhlhOeOCRU6rMm3jsfpdnNrnEKB26du+sAoNY7cYgtJ05+y?=
 =?us-ascii?Q?cy8zJvd3QLP5c2wsuAuLDRn+W2Hjc0Ev/REQnzV+LYVqCBbRqo0brxu/Dgpv?=
 =?us-ascii?Q?90gnTuer6vgch6EvK6Xn3rYzQqGTLd/Rj2jTLZe3IocQH/dAmbGCOQdZgT77?=
 =?us-ascii?Q?PxCgXhNvt4Sg9rOD8GluKYH48FhHSPrUUMdM5UAU6N72ddWxSzn9ICxFj5eU?=
 =?us-ascii?Q?2ycLv3F6DEukbZ9Bs/7JDkTRK/fm+vJ1Gv+Y43+WR9lt/VborOgJ94QbBacf?=
 =?us-ascii?Q?4YJQik2Ao5YTDcX7NQXM1bZmLFBV9LkKDyvJXq1b55HGqiNnyh+pXcXLeR4b?=
 =?us-ascii?Q?v7xL0iNYPpwKrmsOO1lx0rt9OSEg8ASnUHQc/MlYAOT17VmOktj6vEUr2EA8?=
 =?us-ascii?Q?/iS8dFhTNW6oM/9RI0tcoUZlDBaYBcj8Jx7C2mFXjgdbJvIttG58hzRiNZYK?=
 =?us-ascii?Q?Ohuqugm5jOJhYt9j5sCyh/jMG6t6kSpbaq/gl7lDGb+lblFQVyjbJd3qfB63?=
 =?us-ascii?Q?QtvGwYZRgwTwOe35xhawHKTecbYb1WC3p7RPdUpwAuwuxBQusRMeEi6tTwlP?=
 =?us-ascii?Q?QVwSEvo4pMB0xwd5FFj3ZYL3xljlyKU0Xh/M4OtgNkP9EY7aye/pyLd1EjC2?=
 =?us-ascii?Q?VShKrSGmweplsTPfr39pq561JLLATFGE/BHSLJ2oHpmIafhqWK8oEuZy0tV+?=
 =?us-ascii?Q?UiL8t4l/R/zzKcYiM20+XTFhTxsuWGYBHvM8p9CVumbH/LG8tBeAo9/KHJrD?=
 =?us-ascii?Q?Zmia6Td1BBWyzivDyrSL6ANWQD6qxa+eogP0Lg0+Z4cBFSOva4Ne9rh//7xP?=
 =?us-ascii?Q?Si2Iv5DXF9ZIVUizzi2e3TtUHngeGaBDpNob4DWjFqDnK5QHJGfXub2qy/vf?=
 =?us-ascii?Q?h/QRndABIK8/WpSYKHdooxv7ZhO9kSjUHBfM+4c7065P6cVXf9Bx8a5mt+/Z?=
 =?us-ascii?Q?tceYulEdi4Esf9ubcjyDJwrnAYcs+UzfHobnERazmS6TutZaSPg7Iz92R57E?=
 =?us-ascii?Q?rv0/kh23K8tJWiA4YpMMDi6WqRxi/0mrDNgtGp/ioawvzr7czalFIGEpY0x6?=
 =?us-ascii?Q?VsKG7kmu9j4cTl6NPufUn9sP3lm9VFe7yQDF0yU0XPAPemZUDdvf49QMlZvm?=
 =?us-ascii?Q?GFuxj17iPYTaGfNTp2Qb6Ec=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 952dffdb-697e-463e-7b65-08dc746b2043
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 23:11:03.3040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Guv4CSvwZgKIO6sRHDEs+hL1CyH0OR3P4OzzCitwUaN9K+vsBZidVTV/rBKA62yQdfwuN63hTxSccp+YR0c5urZlF2UgAx2ba3rAsbT9C17BgK1ZaHSnssy+nA0PZ3sR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_161113_981475_76EE078F 
X-CRM114-Status: GOOD (  11.01  )
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


Hi

> > dpcm_playback/capture flags are being deprecated in ASoC.
> > Use playback/capture_only flags instead
> > 
> > Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> > 
> > Following Kuninori's series, dpcm_playback/capture will be ignored.
> > However, properly disabling stream direction is important for Amlogic
> > audio drivers.
> > 
> > I'm not too sure how this should be applied to avoid breaking bisect,
> > before or after Kuninori's series. Maybe it should be merged into it ?
> 
> Probably better to integrate it I think?

ASoC needs dpcm_xxx flag *before* my patch.
Your patch is replacing it to xxx_only flag, so it should be applied
*after* my patch. So integrate/merge is good idea, I think.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
