Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF106606A325
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2026 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dFHBvgur;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=jbTWAW23
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uRVp1IicIfRI9Rh+SFi5GbDCc3sEQf5TYyMr930IQDw=; b=dFHBvgur7+pBL7cVOiYyNZ3TK2
	GAOxClJz3W6owP74UVeR00MH7He6x0F054g7a58wE2rHqOi9YxJ8pAAzVFtgDom6xAUZS43FSOZs/
	FK51NTcwlNSKDMmI4l+ahgMpVldyOFKMU54bcMsFMWAJVMKgkyLacG9pkzgE6YuN5KuI08/RbEq3K
	1WwrtT0m3AnaNGGfUKT36seJPoqqFsbDI/Jcjah5UKys4dGwNUrztXMasU4cF8FUduxqGEJcbfqse
	shxXKuipmX5E0BvpAdSFKS02I5gl8Z1CSQgKLczYiYpsoLm4MqSjVtxNmL1jdXOvQNiZXpEZt8him
	sCTm4AnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZub-00000007zEG-15RV;
	Wed, 18 Nov 2026 07:16:57 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZuY-00000007zDk-37kG
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Nov 2026 07:16:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NO9jaa0wwOOetdn8OJcupFMslSzTOSjSlf5r8eRhPBQstEm+QE/H5W86VR++BdNYmiNHE1hQ80hSjRChlOaCHS7qiLwAwk+Pq9WnWUjj/kL3FNPq8EcLPSORqpsiyt+sF+oxFEVAG2Bo4KyY+r9GpU3OnTrsZ6z8+LFXwnhICTEoGZE4G1dbqBZc9/i1TcPajPkYSrrSnDG0Ur79fstmvW0xazLrqSzYKERqVMA1tmXoZg90+Qg6is9MPvcFd2qzj7pKVA4xEf93iLKpUpUFz6twz4DhMF1SsMBXdfdQmhtmGcP0jva//pGkVxGrIUS3K/i7vnVM/0PUnirVHZuCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtSp0ZB7sgXukH75sBJBAz125XSdL/1mzf9dQU9FxRU=;
 b=XXOWW0IPk23ZJo/3fvZkkLWLY3rcVzu9S1WZ/IgUNPib7WABTSkiXBcmrRdOF2itaWlZVQbjB9ZAwDYGWPPu6iTyb5Oq6AphwwbH9gj4ikU1pI2CIZ7lPyxskP4vmF/vLUyM/zwc3MuImAxhySEl1/1mfJQUd0Pz6VxWgsv11/nJdyavd9XXhQzzv7sw7Zp0KnzWAs77/4dnXf2P31EGHZpFzkRJbUcGkHVQeZb0NobBLTxSZvJK0F4sNYW8lD1zY6y+b4cHNQAfMXKs/R2wFhyBhPJTuvR/qBpT0kfrZCm4BFJLdufROmBAP86CGE6S6LcX2fQIx9VmQbXW4r3xMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtSp0ZB7sgXukH75sBJBAz125XSdL/1mzf9dQU9FxRU=;
 b=jbTWAW23DwKT5m4DHyyx4H3DUyp68MaMFwiJFNTGtVmIH/iG/dDcem7t584ZtNOehC9nrpAcL5A3N3ir0jGSaHFnlaG1I4IkZpGrJ0TZ4tJFK4TEm6AkGin4wHfL7xvzNLkfVUNxaT/F7ekWSSEh6TKmlEXCIQprswaF7HTxbxVOlv2doQMuhKU4UClHLd9c/fYrlxrBwV8uiWIoz/WIvxA80M9hbhLVmC54eRjfZBCaY86/PP38q1O3abwt/qkefLtsUtXKGxlwDQhDjrGyxQ4Y2NI15rhhMX6bWNTNT4Ublx2nvvyU2va9Pibnz8PF2boI/6UEONOuz/puaXDsBg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7889.apcprd03.prod.outlook.com (2603:1096:101:165::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 07:16:43 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 07:16:42 +0000
Message-ID: <1282161c-f1fe-40fa-a539-f95fbdeb46e5@amlogic.com>
Date: Wed, 18 Nov 2026 15:16:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] i2c: amlogic: Add Amlogic A9 I2C controller
 driver
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>,
 Junyi Zhao <junyi.zhao@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20261117-a9-i2c-v10-0-33ea9aefce20@amlogic.com>
 <20261117-a9-i2c-v10-2-33ea9aefce20@amlogic.com>
 <23a72c5e-7eb7-4a4e-9f06-fdc4976b05bc@web.de>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <23a72c5e-7eb7-4a4e-9f06-fdc4976b05bc@web.de>
X-ClientProxiedBy: TYCP286CA0200.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::6) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 773ada8c-fea2-469c-7c3c-08df4543e57e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|11063799006|56012099006|4143699003|261026121527099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lHJ5pYciV/9IbPES7D4RCI0aDhU8CofcZdjKHlyovqF9AampdVa/a8qKhap4OOuQpNtwtpg5obPW4Fa3Tb/YNhFi6iunTtYN0KFNqNKFXYRAV4UCRqHjuOuXxWo4Nk3mNZI+eB+5yGO6AebVH1xxxTKp9KIoMSet9gOpmQzf4fXx0I9IYRkc9d7DRyLOV1KzSRhqUd2c4Q2qVVk86Y9QLNzIkVkMofSpSyDzTD57qt5lsrLX6ZV3dEIiH5jy/EU8xLD/G2jBOv8W5Kzn7i0FWR1zuTykvg3F7va3o1JgA9e5lD3jVIctiRD64CP5rJUXGZrLJv3rXOVkuM6sapr5u4CE//cCZvvZSiZhyZSmbgLOCKxHnIs7eSMqdjczFeOS88AgSBt/YhNwm/Hy4qkDHbR6uM8zEdShDrw8mBc4sdgdZdSX2Syzlxcncnkhz8PNwnTrkCSIZjUc7Nz5ILAfl8Qv3+5vheCRtBfSfXXbhlyc5QIGnSwXH6AXi0Ih1HN4sd2A9Ie7VlhR93k5i8liPt+ewI1b1sjaaqnSngoxrr5+RfQmaAFdW/jEZhUXUjELGyiB6g6Uf+YCNT4nVnLGv4L1Lub4bis/s25nDzo8ujkctkqp4TC0jmVo8Kwoaqvg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmJYV1BzWStwYjhBWTRjOUdJWGMyeWg5RDBpS214V3ZqYmxzRURZeWNCMzVC?=
 =?utf-8?B?TmFNMEU0TEFoMUlCdVIyZHRzWVdUeE00cUoxRWZVL2MxeHEzcFlWNnN1V3pq?=
 =?utf-8?B?R1A5ZTBqTHRpZG5mVXVzN1RVZU5kQ2lnWTJ3am1ob3JiV0NlWnBpTVAxcmpu?=
 =?utf-8?B?emhkbjJzeklUbWswR1RYNkNac2tpdXhiZExmWHc2TWtzUzhoRTZRQ1BVeTVW?=
 =?utf-8?B?YURLWEJQUlV0NHRISnpjMnBLKzJ3WFNrYm55K2RBOGkxVDd0WHVWRnU4cUxw?=
 =?utf-8?B?bjArRFZVSXBDTlJDUG9aNFhtRC8vNlRIZzRaSjROQm5tN0hoNkpUdVpWeU1r?=
 =?utf-8?B?aW5EcTU4UW1yenR2bTdBMFJjdVVBMFhleGR0dTZ6K1B1dXhHdko5cUhNUHF6?=
 =?utf-8?B?NXA0YkhqNjVlZ2tmUFVRV0tZWEZHVGVIai81TDZpRmY0bCtXUXBac21RSWZp?=
 =?utf-8?B?VGFTNXUyRXI2S1ZBSmovRnQzeHRWNDBUUHRQR1V2VGx1aEFiWE1HZ0pDSDNJ?=
 =?utf-8?B?SURQNmt6Lzc5dHlDTzlnUlJUdkFRNGYra1hEL1BwckpOWFBvcVB6c3RHaU1X?=
 =?utf-8?B?NEMrOVZqV2dwVGdKMzRhSmVyZGlQc05Rd0N2R3BLeXYxZkRwTVQ4WmltYzdz?=
 =?utf-8?B?U3kzd0tpb2dONW90U2NPY3lQcU4wNW5EdVphcE96NzF6ZTUrZFR3RHVXUUpQ?=
 =?utf-8?B?ZVozMTU5WUJaUjlxb3ZBb1drM2V0M1MwNjBGMmsxOFRMenk1Nnh0dmhHOWlw?=
 =?utf-8?B?MlNEblhaY21QV0YrcEhyZzRZMlI3RFlGMzR1Z3FZb1NVWC9NMG13R0VMemZ6?=
 =?utf-8?B?Mk03c2FqWkd6Qk9PaUtNK2ZaNmM0Vk9aTnJDMGJaNUJIeU9rVzg4VVJ6SFFv?=
 =?utf-8?B?bVM0UU43cDlpTVZoYnR6WmYwOHQ4dEdkUUZOWExlODRDcm1XMWVQODdSNEpx?=
 =?utf-8?B?M2FFbldjV2FjUElQcW5hNWNGZ045UUxESWRrOSsydHFzSGNJcmpnZlVuU09K?=
 =?utf-8?B?bCtYSjc0UDdWLzZjSW1zazNuYmZxSFRaS1BndGlVTG5XSWdWZ2ljUkxFQWhR?=
 =?utf-8?B?S2RZSGQwVTFMclNqNk5mbEZ4dnVqTE9wVGpzU2doeTBwNG8yUkkxMTdReGNl?=
 =?utf-8?B?U0ZQOFdkSUJJR2hPU0syU01xV2hic2NuRlBFMzI1VGYwOVhoaUJwK2tjRTFr?=
 =?utf-8?B?NU1IYVJZYWZkeWNmYzRVeFRTRXhLQXlqOWJnQVBGaTBzOGxpTGsyUFQyekdT?=
 =?utf-8?B?eTJzUFB2YlJmVnhSZDBqL2oyaEwyZ1cwSDNsQzY1MFVzS2FLNU9tVERGak10?=
 =?utf-8?B?TEEwbzFVZE9SVjVMVVMwMm11cmVKcFR6N0doQ2RxUi9aY09aeFlhbDZzNkhp?=
 =?utf-8?B?dGxwNEFJc2RnNy9RVUVqcDFNMmVFa1NpUWtOWStBQmh5Vm9nVlZDVWhwbWlq?=
 =?utf-8?B?SVV0VmtnU0pXeDc2VS9NTlpNV3hrTUsycW9KWVdOenFJUTc5MDEwUmNOSncw?=
 =?utf-8?B?R2NKSW9CSkJDdVI1R3RITkJiNTF0MXF6c3krdnJVd3lOL0JPL0hrb09sOGhj?=
 =?utf-8?B?TnFYVUkycXg2Q1NzSkFhY1EwTVVkSGZ0Y1UrbXk3R3FMUytEK3ZQeFAvNGs1?=
 =?utf-8?B?eExzWWlDeDNyV2F0a1orSUF1b0VqS0gxTnlaQzMyTUxyS2o4MkNUc1dFeDhq?=
 =?utf-8?B?UjkxelhUNHEwdFY5bWp3bW9lN1daWjBzbldVc1FwZzhvMytacktlSXJWamxO?=
 =?utf-8?B?ZFZCc01NbmFncFB1N1JCbUZRWERtd0o2a211amNQUE1xYVJMN1ZxM21oeDkv?=
 =?utf-8?B?R01nY1BJUWlIT281ellNbGxHUGF6SlFldW1UTGlhTFhudmwzNGtHZTZ0Nk1y?=
 =?utf-8?B?WDloUmM1K1F0dHBCU2ZwNjFXa3EvWkZUb1ArYmp1b3NSODZUZmc1K1FDZnpp?=
 =?utf-8?B?eDBxWmtoaGJGU3p2aG5KVTJGR2k3amIweUxSZm5tZnZmR3JpSm1sY3g3T0tU?=
 =?utf-8?B?RlpwbUFsWnkva01vUGJad3pyb3NFZldYd0xZbWZnbEE5NkdLZk1OMi85Z3JI?=
 =?utf-8?B?c2dKMUIzZVpQK1MybXhrbUVPOEM0R0NSSDFvZjVycDBveVJobDY3dllvSnU2?=
 =?utf-8?B?WFlqOEpJQXRRTHZhS2cxSGsyWkdzZXI5ZzFkYWE5MnMzL3pOOXg0YmFUNDhq?=
 =?utf-8?B?WDhuOTJldTFHWjRGa043SnhPUjlXc1EwOGIvQllHTy8yQW9sNnVRTTV3NWFr?=
 =?utf-8?B?c3NOVGxFNldhcFN2dGEzQ243aURhZno5RkZTdTNYeE9FYUVqbGJVMkZ0Z3VH?=
 =?utf-8?B?M3R5d0V5WEZ1QWVKSVJzS1UyVVhBcC8vcGdOeS9ESk5renBPdHJMMzF4VG50?=
 =?utf-8?Q?BqbomX3WwNUf1b9A=3D?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 773ada8c-fea2-469c-7c3c-08df4543e57e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 07:16:42.7044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ivnb1lWTgOt0u57gScIFRYKdL6o6rJXkn1sCTZcnj/P0dnEYaK0hdIGjy10bCX2QmN95fD2GdA1D+oPBL2wJAsZEfLzIMvtPn/hUsycEzjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_231654_823980_BD9962ED 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWFya3VzLAoKT24gMjAyNi8xMS8xNyAyMToyMSwgTWFya3VzIEVsZnJpbmcgd3JvdGU6Cj4g
4oCmCj4+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYW1sb2dpYy1hOS5jCj4+IEBAIC0w
LDAgKzEsNDI4IEBACj4g4oCmCj4+ICtzdGF0aWMgaW50IGFtbF9pMmNfeGZlcl9tc2coc3RydWN0
IGFtbF9pMmMgKmkyYywgc3RydWN0IGkyY19tc2cgKm1zZywgYm9vbCBsYXN0KQo+PiArewo+IOKA
pgo+PiArICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaTJjLT5sb2NrLCBmbGFncyk7Cj4+ICsgICAg
IGkyYy0+c3RhdGUgPSAobXNnLT5mbGFncyAmIEkyQ19NX1JEKSA/IEE5X1NUQVRFX1JFQUQgOiBB
OV9TVEFURV9XUklURTsKPiDigKYKPj4gKyAgICAgLyogU3RhcnQgdGhlIHRyYW5zZmVyICovCj4+
ICsgICAgIGFtbF9pMmNfZG9fc3RhcnQoaTJjLCBtc2cpOwo+PiArICAgICBzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZpMmMtPmxvY2ssIGZsYWdzKTsKPiDigKYKPj4gKyAgICAgaWYgKCF0aW1lX2xl
ZnQpIHsKPj4gKyAgICAgICAgICAgICBndWFyZChzcGlubG9ja19pcnFzYXZlKSgmaTJjLT5sb2Nr
KTsKPiDigKYKPj4gKyAgICAgfQo+PiArCj4+ICsgICAgIHJldHVybiBpMmMtPmVycm9yOwo+PiAr
feKApgo+IFdpbGwgZGV2ZWxvcG1lbnQgaW50ZXJlc3RzIGdyb3cgYWxzbyBmb3IgdGhlIGFwcGxp
Y2F0aW9uIG9mIGFub3RoZXIgc2NvcGVkIGxvY2sgZ3VhcmQ/Cj4gaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjcuNC1yYzEvc291cmNlL2luY2x1ZGUvbGludXgvY2xlYW51cC5oI0wz
MjUtTDMyOAo+IAoKV2lsbCBkby4KCj4gUmVnYXJkcywKPiBNYXJrdXMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
