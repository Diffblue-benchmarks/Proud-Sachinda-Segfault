PGDMP     /    8                w            postgres    11.1    11.1 l    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    13012    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_South Africa.1252' LC_CTYPE = 'English_South Africa.1252';
    DROP DATABASE postgres;
             postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                  postgres    false    2966                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                  false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                       false    1            �            1259    24715    course    TABLE     �   CREATE TABLE public.course (
    course_id integer NOT NULL,
    course_name character varying(50) NOT NULL,
    course_code character varying(12) NOT NULL
);
    DROP TABLE public.course;
       public         postgres    false            �            1259    24713    course_course_id_seq    SEQUENCE     �   CREATE SEQUENCE public.course_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.course_course_id_seq;
       public       postgres    false    198            �           0    0    course_course_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.course_course_id_seq OWNED BY public.course.course_id;
            public       postgres    false    197            �            1259    24762    examiner    TABLE     �   CREATE TABLE public.examiner (
    examiner_id integer NOT NULL,
    lecturer_id character varying(12),
    role_id integer,
    test_id integer
);
    DROP TABLE public.examiner;
       public         postgres    false            �            1259    24760    examiner_examiner_id_seq    SEQUENCE     �   CREATE SEQUENCE public.examiner_examiner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.examiner_examiner_id_seq;
       public       postgres    false    207            �           0    0    examiner_examiner_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.examiner_examiner_id_seq OWNED BY public.examiner.examiner_id;
            public       postgres    false    206            �            1259    24721    lecturer    TABLE     �   CREATE TABLE public.lecturer (
    lecturer_id character varying(12) NOT NULL,
    lecturer_fname character varying(50) NOT NULL,
    lecturer_lname character varying(50) NOT NULL
);
    DROP TABLE public.lecturer;
       public         postgres    false            �            1259    24785    question    TABLE     �  CREATE TABLE public.question (
    question_id integer NOT NULL,
    lecturer_id character varying(12),
    question_type character varying(50) NOT NULL,
    question_body character varying(10000) NOT NULL,
    question_ans character varying(1000) NOT NULL,
    question_date date,
    question_last_used date,
    question_variance integer,
    question_mark integer NOT NULL,
    course_id integer NOT NULL,
    question_difficulty integer
);
    DROP TABLE public.question;
       public         postgres    false            �            1259    24819    mcq_question    TABLE     �   CREATE TABLE public.mcq_question (
    mcq_id integer NOT NULL,
    mcq_choices character varying(1000)
)
INHERITS (public.question);
     DROP TABLE public.mcq_question;
       public         postgres    false    209            �            1259    24817    mcq_question_mcq_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mcq_question_mcq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.mcq_question_mcq_id_seq;
       public       postgres    false    211            �           0    0    mcq_question_mcq_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.mcq_question_mcq_id_seq OWNED BY public.mcq_question.mcq_id;
            public       postgres    false    210            �            1259    24831    practical_question    TABLE     �   CREATE TABLE public.practical_question (
    pq_id integer NOT NULL,
    sample_input character varying(1000),
    sample_output character varying(100)
)
INHERITS (public.question);
 &   DROP TABLE public.practical_question;
       public         postgres    false    209            �            1259    24829    practical_question_pq_id_seq    SEQUENCE     �   CREATE SEQUENCE public.practical_question_pq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.practical_question_pq_id_seq;
       public       postgres    false    213            �           0    0    practical_question_pq_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.practical_question_pq_id_seq OWNED BY public.practical_question.pq_id;
            public       postgres    false    212            �            1259    24783    question_question_id_seq    SEQUENCE     �   CREATE SEQUENCE public.question_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.question_question_id_seq;
       public       postgres    false    209            �           0    0    question_question_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.question_question_id_seq OWNED BY public.question.question_id;
            public       postgres    false    208            �            1259    24754    role    TABLE     g   CREATE TABLE public.role (
    role_id integer NOT NULL,
    role_description character varying(50)
);
    DROP TABLE public.role;
       public         postgres    false            �            1259    24752    role_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.role_role_id_seq;
       public       postgres    false    205            �           0    0    role_role_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.role_role_id_seq OWNED BY public.role.role_id;
            public       postgres    false    204            �            1259    24728    subject    TABLE     �   CREATE TABLE public.subject (
    subject_id integer NOT NULL,
    course_id integer NOT NULL,
    lecturer_id character varying(12)
);
    DROP TABLE public.subject;
       public         postgres    false            �            1259    24726    subject_subject_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subject_subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.subject_subject_id_seq;
       public       postgres    false    201            �           0    0    subject_subject_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.subject_subject_id_seq OWNED BY public.subject.subject_id;
            public       postgres    false    200            �            1259    32941    tag    TABLE     {   CREATE TABLE public.tag (
    tag_id integer NOT NULL,
    tag_name character varying NOT NULL,
    question_id integer
);
    DROP TABLE public.tag;
       public         postgres    false            �            1259    32939    tag_tag_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tag_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.tag_tag_id_seq;
       public       postgres    false    221            �           0    0    tag_tag_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.tag_tag_id_seq OWNED BY public.tag.tag_id;
            public       postgres    false    220            �            1259    24746    test    TABLE     �   CREATE TABLE public.test (
    test_id integer NOT NULL,
    test_is_exam boolean,
    test_is_draft boolean DEFAULT true NOT NULL,
    test_draft_name character varying,
    course_id integer,
    lecturer_id integer
);
    DROP TABLE public.test;
       public         postgres    false            �            1259    24744    test_test_id_seq    SEQUENCE     �   CREATE SEQUENCE public.test_test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.test_test_id_seq;
       public       postgres    false    203            �           0    0    test_test_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.test_test_id_seq OWNED BY public.test.test_id;
            public       postgres    false    202            �            1259    32914    track    TABLE     �   CREATE TABLE public.track (
    track_id integer NOT NULL,
    question_id integer,
    test_id integer,
    question_number integer,
    track_order integer
);
    DROP TABLE public.track;
       public         postgres    false            �            1259    32912    tracks_tracks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tracks_tracks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tracks_tracks_id_seq;
       public       postgres    false    219            �           0    0    tracks_tracks_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tracks_tracks_id_seq OWNED BY public.track.track_id;
            public       postgres    false    218            �            1259    24855    variant    TABLE     }   CREATE TABLE public.variant (
    variant_num integer NOT NULL,
    id integer NOT NULL,
    question_id integer NOT NULL
);
    DROP TABLE public.variant;
       public         postgres    false            �            1259    24853    variant_variant_num_seq    SEQUENCE     �   CREATE SEQUENCE public.variant_variant_num_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.variant_variant_num_seq;
       public       postgres    false    217            �           0    0    variant_variant_num_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.variant_variant_num_seq OWNED BY public.variant.variant_num;
            public       postgres    false    216            �            1259    24843    written_question    TABLE     n   CREATE TABLE public.written_question (
    written_question_id integer NOT NULL
)
INHERITS (public.question);
 $   DROP TABLE public.written_question;
       public         postgres    false    209            �            1259    24841 (   written_question_written_question_id_seq    SEQUENCE     �   CREATE SEQUENCE public.written_question_written_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.written_question_written_question_id_seq;
       public       postgres    false    215            �           0    0 (   written_question_written_question_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.written_question_written_question_id_seq OWNED BY public.written_question.written_question_id;
            public       postgres    false    214            �
           2604    24718    course course_id    DEFAULT     t   ALTER TABLE ONLY public.course ALTER COLUMN course_id SET DEFAULT nextval('public.course_course_id_seq'::regclass);
 ?   ALTER TABLE public.course ALTER COLUMN course_id DROP DEFAULT;
       public       postgres    false    198    197    198            �
           2604    24765    examiner examiner_id    DEFAULT     |   ALTER TABLE ONLY public.examiner ALTER COLUMN examiner_id SET DEFAULT nextval('public.examiner_examiner_id_seq'::regclass);
 C   ALTER TABLE public.examiner ALTER COLUMN examiner_id DROP DEFAULT;
       public       postgres    false    207    206    207            �
           2604    24822    mcq_question question_id    DEFAULT     �   ALTER TABLE ONLY public.mcq_question ALTER COLUMN question_id SET DEFAULT nextval('public.question_question_id_seq'::regclass);
 G   ALTER TABLE public.mcq_question ALTER COLUMN question_id DROP DEFAULT;
       public       postgres    false    211    208            �
           2604    24823    mcq_question mcq_id    DEFAULT     z   ALTER TABLE ONLY public.mcq_question ALTER COLUMN mcq_id SET DEFAULT nextval('public.mcq_question_mcq_id_seq'::regclass);
 B   ALTER TABLE public.mcq_question ALTER COLUMN mcq_id DROP DEFAULT;
       public       postgres    false    211    210    211            �
           2604    24834    practical_question question_id    DEFAULT     �   ALTER TABLE ONLY public.practical_question ALTER COLUMN question_id SET DEFAULT nextval('public.question_question_id_seq'::regclass);
 M   ALTER TABLE public.practical_question ALTER COLUMN question_id DROP DEFAULT;
       public       postgres    false    213    208            �
           2604    24835    practical_question pq_id    DEFAULT     �   ALTER TABLE ONLY public.practical_question ALTER COLUMN pq_id SET DEFAULT nextval('public.practical_question_pq_id_seq'::regclass);
 G   ALTER TABLE public.practical_question ALTER COLUMN pq_id DROP DEFAULT;
       public       postgres    false    213    212    213            �
           2604    24788    question question_id    DEFAULT     |   ALTER TABLE ONLY public.question ALTER COLUMN question_id SET DEFAULT nextval('public.question_question_id_seq'::regclass);
 C   ALTER TABLE public.question ALTER COLUMN question_id DROP DEFAULT;
       public       postgres    false    209    208    209            �
           2604    24757    role role_id    DEFAULT     l   ALTER TABLE ONLY public.role ALTER COLUMN role_id SET DEFAULT nextval('public.role_role_id_seq'::regclass);
 ;   ALTER TABLE public.role ALTER COLUMN role_id DROP DEFAULT;
       public       postgres    false    205    204    205            �
           2604    24731    subject subject_id    DEFAULT     x   ALTER TABLE ONLY public.subject ALTER COLUMN subject_id SET DEFAULT nextval('public.subject_subject_id_seq'::regclass);
 A   ALTER TABLE public.subject ALTER COLUMN subject_id DROP DEFAULT;
       public       postgres    false    201    200    201            �
           2604    32944 
   tag tag_id    DEFAULT     h   ALTER TABLE ONLY public.tag ALTER COLUMN tag_id SET DEFAULT nextval('public.tag_tag_id_seq'::regclass);
 9   ALTER TABLE public.tag ALTER COLUMN tag_id DROP DEFAULT;
       public       postgres    false    221    220    221            �
           2604    24749    test test_id    DEFAULT     l   ALTER TABLE ONLY public.test ALTER COLUMN test_id SET DEFAULT nextval('public.test_test_id_seq'::regclass);
 ;   ALTER TABLE public.test ALTER COLUMN test_id DROP DEFAULT;
       public       postgres    false    203    202    203            �
           2604    32917    track track_id    DEFAULT     r   ALTER TABLE ONLY public.track ALTER COLUMN track_id SET DEFAULT nextval('public.tracks_tracks_id_seq'::regclass);
 =   ALTER TABLE public.track ALTER COLUMN track_id DROP DEFAULT;
       public       postgres    false    218    219    219            �
           2604    24858    variant variant_num    DEFAULT     z   ALTER TABLE ONLY public.variant ALTER COLUMN variant_num SET DEFAULT nextval('public.variant_variant_num_seq'::regclass);
 B   ALTER TABLE public.variant ALTER COLUMN variant_num DROP DEFAULT;
       public       postgres    false    216    217    217            �
           2604    24846    written_question question_id    DEFAULT     �   ALTER TABLE ONLY public.written_question ALTER COLUMN question_id SET DEFAULT nextval('public.question_question_id_seq'::regclass);
 K   ALTER TABLE public.written_question ALTER COLUMN question_id DROP DEFAULT;
       public       postgres    false    215    208            �
           2604    24847 $   written_question written_question_id    DEFAULT     �   ALTER TABLE ONLY public.written_question ALTER COLUMN written_question_id SET DEFAULT nextval('public.written_question_written_question_id_seq'::regclass);
 S   ALTER TABLE public.written_question ALTER COLUMN written_question_id DROP DEFAULT;
       public       postgres    false    214    215    215            y          0    24715    course 
   TABLE DATA               E   COPY public.course (course_id, course_name, course_code) FROM stdin;
    public       postgres    false    198   �}       �          0    24762    examiner 
   TABLE DATA               N   COPY public.examiner (examiner_id, lecturer_id, role_id, test_id) FROM stdin;
    public       postgres    false    207   ~       z          0    24721    lecturer 
   TABLE DATA               O   COPY public.lecturer (lecturer_id, lecturer_fname, lecturer_lname) FROM stdin;
    public       postgres    false    199   9~       �          0    24819    mcq_question 
   TABLE DATA               �   COPY public.mcq_question (question_id, lecturer_id, question_type, question_body, question_ans, question_date, question_last_used, question_variance, question_mark, mcq_id, mcq_choices, course_id, question_difficulty) FROM stdin;
    public       postgres    false    211   �~       �          0    24831    practical_question 
   TABLE DATA               �   COPY public.practical_question (question_id, lecturer_id, question_type, question_body, question_ans, question_date, question_last_used, question_variance, question_mark, pq_id, sample_input, sample_output, course_id, question_difficulty) FROM stdin;
    public       postgres    false    213   �       �          0    24785    question 
   TABLE DATA               �   COPY public.question (question_id, lecturer_id, question_type, question_body, question_ans, question_date, question_last_used, question_variance, question_mark, course_id, question_difficulty) FROM stdin;
    public       postgres    false    209   V�       �          0    24754    role 
   TABLE DATA               9   COPY public.role (role_id, role_description) FROM stdin;
    public       postgres    false    205   �       |          0    24728    subject 
   TABLE DATA               E   COPY public.subject (subject_id, course_id, lecturer_id) FROM stdin;
    public       postgres    false    201   !�       �          0    32941    tag 
   TABLE DATA               <   COPY public.tag (tag_id, tag_name, question_id) FROM stdin;
    public       postgres    false    221   >�       ~          0    24746    test 
   TABLE DATA               m   COPY public.test (test_id, test_is_exam, test_is_draft, test_draft_name, course_id, lecturer_id) FROM stdin;
    public       postgres    false    203   ��       �          0    32914    track 
   TABLE DATA               ]   COPY public.track (track_id, question_id, test_id, question_number, track_order) FROM stdin;
    public       postgres    false    219   �       �          0    24855    variant 
   TABLE DATA               ?   COPY public.variant (variant_num, id, question_id) FROM stdin;
    public       postgres    false    217   ,�       �          0    24843    written_question 
   TABLE DATA               �   COPY public.written_question (question_id, lecturer_id, question_type, question_body, question_ans, question_date, question_last_used, question_variance, question_mark, written_question_id, course_id, question_difficulty) FROM stdin;
    public       postgres    false    215   I�       �           0    0    course_course_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.course_course_id_seq', 2, true);
            public       postgres    false    197            �           0    0    examiner_examiner_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.examiner_examiner_id_seq', 1, false);
            public       postgres    false    206            �           0    0    mcq_question_mcq_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.mcq_question_mcq_id_seq', 3, true);
            public       postgres    false    210            �           0    0    practical_question_pq_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.practical_question_pq_id_seq', 9, true);
            public       postgres    false    212            �           0    0    question_question_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.question_question_id_seq', 30, true);
            public       postgres    false    208            �           0    0    role_role_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.role_role_id_seq', 1, false);
            public       postgres    false    204            �           0    0    subject_subject_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.subject_subject_id_seq', 1, false);
            public       postgres    false    200            �           0    0    tag_tag_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tag_tag_id_seq', 32, true);
            public       postgres    false    220            �           0    0    test_test_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.test_test_id_seq', 24, true);
            public       postgres    false    202            �           0    0    tracks_tracks_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tracks_tracks_id_seq', 28, true);
            public       postgres    false    218            �           0    0    variant_variant_num_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.variant_variant_num_seq', 1, false);
            public       postgres    false    216            �           0    0 (   written_question_written_question_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.written_question_written_question_id_seq', 8, true);
            public       postgres    false    214            �
           2606    24720    course course_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);
 <   ALTER TABLE ONLY public.course DROP CONSTRAINT course_pkey;
       public         postgres    false    198            �
           2606    24767    examiner examiner_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.examiner
    ADD CONSTRAINT examiner_pkey PRIMARY KEY (examiner_id);
 @   ALTER TABLE ONLY public.examiner DROP CONSTRAINT examiner_pkey;
       public         postgres    false    207            �
           2606    24725    lecturer lecturer_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.lecturer
    ADD CONSTRAINT lecturer_pkey PRIMARY KEY (lecturer_id);
 @   ALTER TABLE ONLY public.lecturer DROP CONSTRAINT lecturer_pkey;
       public         postgres    false    199            �
           2606    24828    mcq_question mcq_question_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.mcq_question
    ADD CONSTRAINT mcq_question_pkey PRIMARY KEY (mcq_id);
 H   ALTER TABLE ONLY public.mcq_question DROP CONSTRAINT mcq_question_pkey;
       public         postgres    false    211            �
           2606    24840 *   practical_question practical_question_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.practical_question
    ADD CONSTRAINT practical_question_pkey PRIMARY KEY (pq_id);
 T   ALTER TABLE ONLY public.practical_question DROP CONSTRAINT practical_question_pkey;
       public         postgres    false    213            �
           2606    24793    question question_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (question_id);
 @   ALTER TABLE ONLY public.question DROP CONSTRAINT question_pkey;
       public         postgres    false    209            �
           2606    24759    role role_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public         postgres    false    205            �
           2606    24733    subject subject_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (subject_id);
 >   ALTER TABLE ONLY public.subject DROP CONSTRAINT subject_pkey;
       public         postgres    false    201            �
           2606    32949    tag tag_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_id);
 6   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_pkey;
       public         postgres    false    221            �
           2606    24751    test test_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (test_id);
 8   ALTER TABLE ONLY public.test DROP CONSTRAINT test_pkey;
       public         postgres    false    203            �
           2606    24860    variant variant_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_pkey PRIMARY KEY (variant_num);
 >   ALTER TABLE ONLY public.variant DROP CONSTRAINT variant_pkey;
       public         postgres    false    217            �
           2606    24852 &   written_question written_question_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.written_question
    ADD CONSTRAINT written_question_pkey PRIMARY KEY (written_question_id);
 P   ALTER TABLE ONLY public.written_question DROP CONSTRAINT written_question_pkey;
       public         postgres    false    215            �
           2606    24768 "   examiner examiner_lecturer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.examiner
    ADD CONSTRAINT examiner_lecturer_id_fkey FOREIGN KEY (lecturer_id) REFERENCES public.lecturer(lecturer_id);
 L   ALTER TABLE ONLY public.examiner DROP CONSTRAINT examiner_lecturer_id_fkey;
       public       postgres    false    2782    207    199            �
           2606    24773    examiner examiner_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.examiner
    ADD CONSTRAINT examiner_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(role_id);
 H   ALTER TABLE ONLY public.examiner DROP CONSTRAINT examiner_role_id_fkey;
       public       postgres    false    205    2788    207            �
           2606    24778    examiner examiner_test_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.examiner
    ADD CONSTRAINT examiner_test_id_fkey FOREIGN KEY (test_id) REFERENCES public.test(test_id);
 H   ALTER TABLE ONLY public.examiner DROP CONSTRAINT examiner_test_id_fkey;
       public       postgres    false    203    207    2786            �
           2606    32907     question question_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);
 J   ALTER TABLE ONLY public.question DROP CONSTRAINT question_course_id_fkey;
       public       postgres    false    198    209    2780            �
           2606    24794 "   question question_lecturer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_lecturer_id_fkey FOREIGN KEY (lecturer_id) REFERENCES public.lecturer(lecturer_id);
 L   ALTER TABLE ONLY public.question DROP CONSTRAINT question_lecturer_id_fkey;
       public       postgres    false    2782    199    209            �
           2606    24734    subject subject_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);
 H   ALTER TABLE ONLY public.subject DROP CONSTRAINT subject_course_id_fkey;
       public       postgres    false    201    2780    198            �
           2606    24739     subject subject_lecturer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_lecturer_id_fkey FOREIGN KEY (lecturer_id) REFERENCES public.lecturer(lecturer_id);
 J   ALTER TABLE ONLY public.subject DROP CONSTRAINT subject_lecturer_id_fkey;
       public       postgres    false    199    201    2782            �
           2606    32950    tag tag_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(question_id);
 B   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_question_id_fkey;
       public       postgres    false    2792    209    221            �
           2606    32934    test test_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);
 B   ALTER TABLE ONLY public.test DROP CONSTRAINT test_course_id_fkey;
       public       postgres    false    203    2780    198            �
           2606    32918    track tracks_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.track
    ADD CONSTRAINT tracks_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(question_id);
 G   ALTER TABLE ONLY public.track DROP CONSTRAINT tracks_question_id_fkey;
       public       postgres    false    2792    209    219            �
           2606    32923    track tracks_test_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.track
    ADD CONSTRAINT tracks_test_id_fkey FOREIGN KEY (test_id) REFERENCES public.test(test_id);
 C   ALTER TABLE ONLY public.track DROP CONSTRAINT tracks_test_id_fkey;
       public       postgres    false    219    2786    203            �
           2606    24861     variant variant_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.question(question_id);
 J   ALTER TABLE ONLY public.variant DROP CONSTRAINT variant_question_id_fkey;
       public       postgres    false    217    209    2792            y   _   x�3��I��+�LMS�,.I�-��u�0606�2���+)�O)M.���S(�Wp�I�/�,��-VH�KQ(�O/J����K�t��6404����� ���      �      x������ � �      z   ;   x�K4426153��OO-�t��OI�J4405�41��K�I�M��M��L*������� k��      �   �   x�}�Mn� F��s���i�eЮ*uÆ�8F������Fr���H0߼�t/D����b兼��R@靷J�:�~� ��ԩ>�Y��,���M�P�T�;�� �0
YJn�����UA8ܤ�2�QJ�>�
�����"QUw�D_;�|�������:�ג#(J�d����ůkU�^�*���Gr�78�-o���exY
;�p��n��%�}���r����Qv��a�����:�_+��6M�m��      �   �   x�}��
�@E��W�R�AE��[�1u1�aw����Ua`���,%��YQ��:��T���0��j`#5��M���7���_?��X�|�vEˎ/��<�`[����I�1*�;��YT1��xj�}c�w����7F�WxR�f�IZL��6�
Z�oE9F9�,���d7M��TS      �   �  x�}T�n�0<�_��uI��hEn��=rх��a�dH*�P�߻K=��F �����̮�i"�|��_^%�	�ur�T@ph5U�*�X�Jޖe�}R:�����P� A�SBg�
'�<���%��K�!_�G>���:����6>��C�d�����x��@��%y��\����*)~�o��I�ʯ_�l�Sr��� �Ѧ�^���H`�28%U��
ݯ����k�*J�������3���O�� @#�D�qq�R�����ɗ׬3e+�wb*����7���/Z�J�
���J��v�����휴n�%���:K����L�-����)����=�&}��ؤl��Y�x�I�i�Y�d�v�߼�ј�f0��J�9�F���e�
�W�I�(�4���C�^fM��t�
mk��z�w�'T݉9I��0�]�m1�::>rL�7�l�$�C�� ߻�4\/40'��ƅ(d��������cr��ɿA�v��r�$��={/伎��Y��9�3�~�9�@z�8��Լ@�5t�ǳ�D#�Ar]�v�n�����ݴ���B3� 3��y�|���f,!�`#$-\�G�\�����I~��&�65�
w�Q��9�Ӥ���?��7��*�����9q��s�جV����      �      x������ � �      |      x������ � �      �   Y   x�32��I��+�LM�4��22��,.I�-��9=�
JK�lN��ǒ����؀�؀3�4/�$3?�7��L, ��8��!�b���� ]V      ~   X   x�3����,�t��O�VI-.Q�Up)JL+Q0�4�q@T����e&�@�@%!���P���_ 0�*(O�
�@ �=... а,      �      x������ � �      �      x������ � �      �   �  x�m��N�0���S���v�.�^�֣��t��']K�zHm����.J������W#���3;��Chzm5�l�?����zC�>�:d��-h찖�Z�Ύ��NS��F.v6fX�n�g��N�yWч�8���1ᷢ��ƥz� n�Z�!%Ա|�4�db�"ID��;�!���e0��o�s�M���,8��P�.�X���0z��hN/?�{���u���4��5��f��L�<��p���4�Ӝ�`D���@��B�r��S7���,[�l{�C�b���1��L!��:�(�ֺkd�6!��t)�w%~�d����N��Q6�n�u@-'ы��jO�i^:��Xc8���>m$5�g�)���,?�d�7�����wP*W�M��l6?�C     